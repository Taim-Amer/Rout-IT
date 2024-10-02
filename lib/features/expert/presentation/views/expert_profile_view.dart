import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:route_it27/core/utils/constants/app_colors.dart';
import 'package:route_it27/core/utils/constants/constants_numbers.dart';
import 'package:route_it27/core/utils/helpers/helper_functions.dart';
import 'package:route_it27/core/utils/styles/app_styles.dart';
import 'package:route_it27/core/widgets/custom_back_button2.dart';
import 'package:route_it27/core/widgets/custom_button_item.dart';
import 'package:route_it27/core/widgets/custom_loading_item.dart';
import 'package:route_it27/features/expert/presentation/view_model/expert_profile_cubit/expert_profile_cubit.dart';
import 'package:route_it27/features/user/presentation/view_model/toggle_follow_expert_cubit/toggle_follow_expert_cubit.dart';
import 'package:route_it27/features/user/presentation/view_model/toggle_follow_expert_cubit/toggle_follow_expert_state.dart';

class ExpertProfileView extends StatelessWidget {
  const ExpertProfileView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExpertProfileCubit, ExpertProfileState>(
      builder: (context, state) {
        if (state is ExpertProfileSuccess) {
          return Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                radius: 1.2,
                stops: const [0.3, 1.0],
                center: const Alignment(-0.5, -0.3),
                colors: [
                  AppColors.primaryColor,
                  AppColors.darkPrimaryColor.withOpacity(0.5),
                ],
              ),
            ),
            child: Scaffold(
              appBar: AppBar(
                leading: const CustomBackButton2(),
                title: const Text("Expert's Profile"),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: HelperFunctions.screenWidth(context) * .05,
                    vertical: HelperFunctions.screenHeight(context) * .04,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min, // <-- Add this line
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 64.0,
                            backgroundColor: Colors.blueGrey[100],
                            backgroundImage: NetworkImage(
                                imageUrl + state.info.student!.image!),
                          ),
                          SizedBox(
                              width:
                                  HelperFunctions.screenWidth(context) * .01),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 30.0, horizontal: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    state.info.student!.name!,
                                    style: const TextStyle(
                                      fontSize: MyTextStyles.titleSize,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Icon(
                                        Iconsax.sms,
                                        size: 20,
                                        color: Colors.orange,
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        // <-- Wrap the Text widget with Expanded
                                        child: Text(
                                          state.info.student!.email!,
                                          style: const TextStyle(
                                            fontSize: MyTextStyles.subTitleSize,
                                          ),
                                          overflow: TextOverflow
                                              .ellipsis, // Handles overflow with ellipsis
                                          softWrap:
                                              false, // Prevents wrapping to a new line
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),

                      // Toggle Follow Button
                      BlocBuilder<ToggleFollowExpertCubit,
                          ToggleFollowExpertState>(
                        builder: (context, followState) {
                          final isFollowing = context
                              .read<ToggleFollowExpertCubit>()
                              .isFollowing(state.info.student!.id!);
                          final buttonText =
                              isFollowing ? 'Followed' : 'Follow';
                          final buttonColor = isFollowing
                              ? Colors.green
                              : AppColors.secondaryColor;

                          return CustomButtonItem(
                            function: () {
                              context
                                  .read<ToggleFollowExpertCubit>()
                                  .toggleFollowExpert(
                                      id: state.info.student!.id!);
                            },
                            text: buttonText,
                            width: double.infinity,
                            height: 45,
                            radius: 20,
                            textColor: Colors.white,
                            backgroundColor: buttonColor,
                          );
                        },
                      ),

                      const SizedBox(height: 20),
                      Card(
                        color: AppColors.secondaryColor.withOpacity(.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: const BorderSide(
                            color: AppColors.secondaryColor,
                            width: 1,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            state.info.student!.bio!,
                            style: const TextStyle(
                              fontSize: MyTextStyles.subTitleSize,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        } else {
          return Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                radius: 1.2,
                stops: const [0.3, 1.0],
                center: const Alignment(-0.5, -0.3),
                colors: [
                  AppColors.primaryColor,
                  AppColors.darkPrimaryColor.withOpacity(0.5),
                ],
              ),
            ),
            child: Scaffold(body: const CustomLoadingItem()),
          );
        }
      },
    );
  }
}
