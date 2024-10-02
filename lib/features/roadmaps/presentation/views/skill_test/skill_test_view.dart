import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_it27/core/utils/constants/app_colors.dart';
import 'package:route_it27/core/utils/constants/constants_numbers.dart';
import 'package:route_it27/core/utils/helpers/helper_functions.dart';
import 'package:route_it27/core/widgets/custom_back_button2.dart';
import 'package:route_it27/features/roadmaps/presentation/view_models/skill_test_cubit/skill_test_cubit.dart';
import 'package:route_it27/features/roadmaps/presentation/views/skill_test/widgets/question_card.dart';
import 'package:route_it27/features/roadmaps/presentation/views/skill_test/widgets/result_card.dart';

class SkillTestView extends StatelessWidget {
  const SkillTestView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Skill Test"),
        leading: const CustomBackButton2(),
      ),
      body: BlocConsumer<SkillTestCubit, SkillTestState>(
        listener: (context, state) {
          if (state is SkillTestComplete) {
            context.read<SkillTestCubit>().pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
          }
        },
        builder: (context, state) {
          if (state is SkillTestLoaded) {
            return Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: HelperFunctions.screenHeight(context) * 0.1,
                    ),
                    Expanded(
                      child: PageView.builder(
                        controller:
                            context.read<SkillTestCubit>().pageController,
                        itemCount: state
                            .questions.length, // Adding 1 for the result page
                        itemBuilder: (context, questionIndex) {
                          // if (questionIndex < state.questions.length) {
                          return QuestionCard(
                            question: state.questions[questionIndex],
                            questionIndex: questionIndex,
                          );
                          // } else {
                          //   return ResultCard(
                          //     message: state.isNextButtonEnabled
                          //         ? "Calculating Result..."
                          //         : "You have completed the test!",
                          //   );
                          // }
                        },
                        physics:
                            const NeverScrollableScrollPhysics(), // Disable swiping
                      ),
                    ),
                    SizedBox(
                      height: HelperFunctions.screenHeight(context) * 0.03,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: HelperFunctions.screenWidth(context) *
                              horizintalMargin,
                          right: HelperFunctions.screenWidth(context) *
                              horizintalMargin),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {
                              context
                                  .read<SkillTestCubit>()
                                  .nextQuestion(isSkip: true);
                            },
                            child: Text(
                              "Skip Question",
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.secondaryColor),
                            onPressed: state.isNextButtonEnabled
                                ? () {
                                    context
                                        .read<SkillTestCubit>()
                                        .nextQuestion();
                                  }
                                : null,
                            child: Text(
                              "Next Question",
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: HelperFunctions.screenHeight(context) * 0.03,
                    ),
                  ],
                ),
              ],
            );
          } else if (state is SkillTestLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is SkillTestFailure) {
            return Center(child: Text("Error: ${state.errMessage}"));
          } else if (state is SkillTestComplete) {
            return ResultCard(
              message: state.message,
              totalXp: state.totalXp,
              numOfCorrectAns: state.numOfCorrectAns,
              testTotalXp: state.testTotalXp,
              testId: state.testId,
              isSuccess: state.isSuccess,
            );
          } else {
            return const Center(
                child: Text("There is No Test in the Skill ):"));
          }
        },
      ),
    );
  }
}
