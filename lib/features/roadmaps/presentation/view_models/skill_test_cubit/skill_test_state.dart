part of 'skill_test_cubit.dart';

abstract class SkillTestState extends Equatable {
  const SkillTestState();
  @override
  List<Object> get props => [];
}

class SkillTestInitial extends SkillTestState {}

class SkillTestLoading extends SkillTestState {}

class SkillTestLoaded extends SkillTestState {
  final List<QuestionModel> questions;
  final int numOfCorrectAns;
  final int currentQuestionIndex;
  final int totalXp;
  final bool isNextButtonEnabled;

  const SkillTestLoaded({
    required this.questions,
    required this.numOfCorrectAns,
    required this.currentQuestionIndex,
    required this.totalXp,
    required this.isNextButtonEnabled,
  });

  @override
  List<Object> get props => [
        questions,
        numOfCorrectAns,
        currentQuestionIndex,
        totalXp,
        isNextButtonEnabled
      ];

  SkillTestLoaded copyWith({
    List<QuestionModel>? questions,
    int? numOfCorrectAns,
    int? currentQuestionIndex,
    int? totalXp,
    bool? isNextButtonEnabled,
  }) {
    return SkillTestLoaded(
      questions: questions ?? this.questions,
      numOfCorrectAns: numOfCorrectAns ?? this.numOfCorrectAns,
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
      totalXp: totalXp ?? this.totalXp,
      isNextButtonEnabled: isNextButtonEnabled ?? this.isNextButtonEnabled,
    );
  }
}
class SkillTestComplete extends SkillTestState {
  final String message;
  final bool isSuccess;
  final int totalXp;
  final int numOfCorrectAns;
  final int testTotalXp;
  final int testId;

  const SkillTestComplete({
    required this.message,
    required this.isSuccess,
    required this.totalXp,
    required this.numOfCorrectAns,
    required this.testTotalXp,
    required this.testId,
  });

  @override
  List<Object> get props => [message, isSuccess, totalXp, numOfCorrectAns, testTotalXp, testId];
}



class SkillTestFailure extends SkillTestState {
  final String errMessage;
  const SkillTestFailure({required this.errMessage});
}
