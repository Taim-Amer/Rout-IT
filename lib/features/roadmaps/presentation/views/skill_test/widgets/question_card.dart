import 'package:flutter/material.dart';
import 'package:route_it27/core/utils/constants/app_colors.dart';
import 'package:route_it27/core/utils/constants/constants_numbers.dart';
import 'package:route_it27/core/utils/helpers/helper_functions.dart';
import 'package:route_it27/features/roadmaps/data/models/question_model.dart';
import 'package:route_it27/features/roadmaps/presentation/views/skill_test/widgets/option.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard(
      {super.key, required this.question, required this.questionIndex});

  final QuestionModel question;
  final int questionIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: HelperFunctions.screenWidth(context) * horizintalMargin),
      padding: EdgeInsets.all(
          HelperFunctions.screenWidth(context) * horizintalMargin),
      decoration: BoxDecoration(
          color: AppColors.whiteColor, borderRadius: BorderRadius.circular(25)),
      child: Column(
        mainAxisSize:
            MainAxisSize.min, // Minimizes the space that Column tries to occupy
        children: [
          Text(
            question.question,
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(color: AppColors.blackColor),
          ),
          SizedBox(
              height: HelperFunctions.screenWidth(context) * horizintalMargin),
          Expanded(
            // Makes sure all remaining space is used by the option list
            child: ListView.builder(
              itemCount: question.options.length,
              itemBuilder: (context, optionIndex) => Option(
                quest: question,
                optionIndex: optionIndex,
                text: question.options[optionIndex],
                questionIndex: questionIndex,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
