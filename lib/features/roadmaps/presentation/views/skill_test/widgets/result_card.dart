import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_it27/core/utils/constants/app_colors.dart';
import 'package:route_it27/core/utils/constants/constants_numbers.dart';
import 'package:route_it27/core/utils/dependency_management/service_locator.dart';
import 'package:route_it27/core/utils/helpers/helper_functions.dart';
import 'package:route_it27/features/roadmaps/data/repos/roadmap_repo_impl.dart';
import 'package:route_it27/features/roadmaps/presentation/view_models/save_test_result_cubit/save_test_result_cubit.dart';

class ResultCard extends StatelessWidget {
  final String message;
  final int totalXp;
  final int numOfCorrectAns;
  final int testTotalXp;
  final int testId;
  final bool isSuccess;

  const ResultCard({
    super.key,
    required this.message,
    required this.totalXp,
    required this.numOfCorrectAns,
    required this.testTotalXp,
    required this.testId,
    required this.isSuccess,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SaveTestResultCubit(roadMapRepo: getIt.get<RoadMapRepoImpl>())
            ..saveTestResult(testId: testId, isPassed: isSuccess),
      child: BlocBuilder<SaveTestResultCubit, SaveTestResultState>(
        builder: (context, state) {
          // if (state is SaveTestResultSuccess) {
            return Container(
              margin: EdgeInsets.symmetric(
                  horizontal:
                      HelperFunctions.screenWidth(context) * horizintalMargin),
              padding: EdgeInsets.all(
                  HelperFunctions.screenWidth(context) * horizintalMargin),
              decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(25)),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      message,
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(color: AppColors.blackColor),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "Your XP: $totalXp",
                      style: Theme.of(context).textTheme.headlineSmall!
                          .copyWith(color: AppColors.blackColor),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Total XP: $testTotalXp",
                      style: Theme.of(context).textTheme.headlineSmall!
                          .copyWith(color: AppColors.blackColor),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Correct Answers: $numOfCorrectAns",
                      style: Theme.of(context).textTheme.headlineSmall!
                          .copyWith(color: AppColors.blackColor),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Test ID: $testId",
                      style: Theme.of(context).textTheme.headlineSmall!
                          .copyWith(color: AppColors.blackColor),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Success: ${isSuccess ? "Yes" : "No"}",
                      style: Theme.of(context).textTheme.headlineSmall!
                          .copyWith(color: AppColors.blackColor),
                    ),
                  ],
                ),
              ),
            );
          // } else if (state is SaveTestResultLoading) {
          //   return const Center(child: CircularProgressIndicator());
          // } else {
          //   return const Center(child: Text("Failed to calculate you result"));
          // }
        },
      ),
    );
  }
}
