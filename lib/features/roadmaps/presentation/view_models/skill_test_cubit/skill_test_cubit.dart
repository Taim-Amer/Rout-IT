import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:route_it27/features/roadmaps/data/models/question_model.dart';
import 'package:route_it27/features/roadmaps/data/repos/roadmap_repo.dart';
part 'skill_test_state.dart';
class SkillTestCubit extends Cubit<SkillTestState> {
  final RoadMapRepo roadMapRepo;
  final PageController pageController = PageController();
  int testId = 0;

  SkillTestCubit({required this.roadMapRepo}) : super(SkillTestInitial());

  Future<void> fetchSkillTest({required int testId}) async {
    this.testId = testId;  // Save the testId for later use
    emit(SkillTestLoading());
    var finalResponse = await roadMapRepo.fetchSkillTest(testId: testId);
    finalResponse.fold(
      (failure) => emit(SkillTestFailure(errMessage: failure.errMessage)),
      (success) {
        var questions = success.result?.questions
                ?.map((q) => QuestionModel(
                      questionId: q.id!,
                      question: q.question!,
                      options: [
                        q.option1,
                        q.option2,
                        q.option3,
                        q.option4,
                        q.option5
                      ].whereType<String>().toList(),
                      correctOption: q.correctOption! - 1,
                      questionXP: q.xp!,
                    ))
                .toList() ??
            [];
        emit(SkillTestLoaded(
            questions: questions,
            numOfCorrectAns: 0,
            currentQuestionIndex: 0,
            totalXp: 0,
            isNextButtonEnabled: false));
      },
    );
  }

  void checkAnswer(int questionIndex, int selectedIndex) {
    final currentState = state;
    if (currentState is SkillTestLoaded) {
      var updatedQuestions = currentState.questions.map((q) {
        if (q.questionId == currentState.questions[questionIndex].questionId) {
          return q.copyWith(
            isAnswered: true,
            selectedAns: selectedIndex,
          );
        }
        return q;
      }).toList();

      int newNumOfCorrectAns = currentState.numOfCorrectAns;
      int newTotalXp = currentState.totalXp;
      if (selectedIndex ==
              currentState.questions[questionIndex].correctOption &&
          !currentState.questions[questionIndex].isAnswered) {
        newNumOfCorrectAns++;
        newTotalXp += currentState.questions[questionIndex].questionXP;
      }

      emit(SkillTestLoaded(
        questions: updatedQuestions,
        numOfCorrectAns: newNumOfCorrectAns,
        currentQuestionIndex: currentState.currentQuestionIndex,
        totalXp: newTotalXp,
        isNextButtonEnabled: true,
      ));
    }
  }

  void nextQuestion({bool isSkip = false}) {
    final currentState = state;
    if (currentState is SkillTestLoaded) {
      if (currentState.currentQuestionIndex < currentState.questions.length - 1) {
        emit(currentState.copyWith(
          currentQuestionIndex: currentState.currentQuestionIndex + 1,
          isNextButtonEnabled: false,
        ));
        pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      } else {
        final int totalXp = currentState.questions
            .fold(0, (sum, question) => sum + question.questionXP);
        final bool isSuccess = currentState.totalXp >= (0.75 * totalXp);
        emit(SkillTestComplete(
          message: isSuccess
              ? "You have passed the test!"
              : "You have failed the test.",
          isSuccess: isSuccess,
          totalXp: currentState.totalXp,
          numOfCorrectAns: currentState.numOfCorrectAns,
          testTotalXp: totalXp,
          testId: this.testId,  // Include the test ID here
        ));
        pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      }
    }
  }
}
