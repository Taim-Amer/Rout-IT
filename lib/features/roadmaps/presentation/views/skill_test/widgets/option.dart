import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_it27/core/utils/helpers/helper_functions.dart';
import 'package:route_it27/features/roadmaps/data/models/question_model.dart';
import 'package:route_it27/features/roadmaps/presentation/view_models/skill_test_cubit/skill_test_cubit.dart';

class Option extends StatelessWidget {
  final String text;
  final int optionIndex;
  final int questionIndex;
  final QuestionModel quest;

  const Option(
      {super.key,
      required this.text,
      required this.optionIndex,
      required this.questionIndex,
      required this.quest});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SkillTestCubit, SkillTestState>(
      builder: (context, state) {
        Color getTheRightColor() {
          if (quest.isAnswered) {
            if (optionIndex == quest.correctOption) {
              return Colors.green;
            } else if (optionIndex == quest.selectedAns) {
              return Colors.red;
            }
          }
          return Colors.grey;
        }

        return InkWell(
          onTap: () {
            if (!quest.isAnswered) {
              BlocProvider.of<SkillTestCubit>(context)
                  .checkAnswer(questionIndex, optionIndex);
            }
          },
          child: Container(
            margin: EdgeInsets.all(HelperFunctions.screenWidth(context) * 0.02),
            padding:
                EdgeInsets.all(HelperFunctions.screenWidth(context) * 0.02),
            decoration: BoxDecoration(
              color: getTheRightColor().withOpacity(0.1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              "${optionIndex + 1}. ${quest.options[optionIndex]}",
              style: TextStyle(color: getTheRightColor(), fontSize: 16),
            ),
          ),
        );
      },
    );
  }
}
