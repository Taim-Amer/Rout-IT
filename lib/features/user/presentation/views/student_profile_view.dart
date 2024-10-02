import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:route_it27/core/utils/constants/app_colors.dart';
import 'package:route_it27/core/utils/constants/constants_numbers.dart';
import 'package:route_it27/core/utils/helpers/helper_functions.dart';
import 'package:route_it27/core/utils/styles/app_styles.dart';
import 'package:route_it27/core/widgets/custom_back_button2.dart';
import 'package:route_it27/core/widgets/custom_loading_item.dart';
import 'package:route_it27/features/user/presentation/view_model/followed_experts_cubit/followed_experts_cubit.dart';
import 'package:route_it27/features/user/presentation/view_model/followed_technologies_cubit/followed_technologies_cubit.dart';
import 'package:route_it27/features/user/presentation/view_model/student_profile_cubit/student_profile_cubit.dart';

class StudentProfileView extends StatelessWidget {
  const StudentProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton2(),
      ),
      body: BlocBuilder<StudentProfileCubit, StudentProfileState>(
        builder: (context, state) {
          if (state is StudentProfileSuccess) {
            return SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: HelperFunctions.screenWidth(context) * .05,
                    vertical: HelperFunctions.screenHeight(context) * .04,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 64.0,
                            backgroundColor: Colors.blueGrey[100],
                            backgroundImage:
                                NetworkImage(imageUrl+state.info.student!.image!),
                          ),
                          SizedBox(
                            width: HelperFunctions.screenWidth(context) * .01,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    state.info.student!.name!,
                                    style: const TextStyle(
                                      fontSize: MyTextStyles.titleSize,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    softWrap: true,
                                    overflow: TextOverflow.visible,
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      const Icon(
                                        color: Colors.orange,
                                        Iconsax.sms,
                                        size: 20,
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: Text(
                                          state.info.student!.email!,
                                          style: const TextStyle(
                                            fontSize: MyTextStyles.subTitleSize,
                                          ),
                                          softWrap: true,
                                          overflow: TextOverflow.visible,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      const Icon(
                                        color: Colors.lightBlueAccent,
                                        Icons.school,
                                        size: 20,
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: Text(
                                          state.info.student!.university!,
                                          style: const TextStyle(
                                            fontSize: MyTextStyles.subTitleSize,
                                          ),
                                          softWrap: true,
                                          overflow: TextOverflow.visible,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      const Icon(
                                        color: Colors.greenAccent,
                                        Iconsax.calendar,
                                        size: 20,
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: Text(
                                          state.info.student!.birthDate!,
                                          style: const TextStyle(
                                            fontSize: MyTextStyles.subTitleSize,
                                          ),
                                          softWrap: true,
                                          overflow: TextOverflow.visible,
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
                      const SizedBox(height: 20),
                      Card(
                        color: AppColors.primaryColor.withOpacity(.9),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: const BorderSide(
                            color: AppColors.primaryColor,
                            width: 1,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            state.info.student!.bio ??
                                "No bio available", // Handle null bio gracefully
                            style: const TextStyle(
                              fontSize: MyTextStyles.subTitleSize,
                            ),
                            softWrap: true,
                            overflow: TextOverflow.visible,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Followed Experts:",
                        style: TextStyle(
                          fontSize: MyTextStyles.subTitleSize,
                        ),
                      ),
                      const SizedBox(height: 15),
                      BlocBuilder<FollowedExpertsCubit, FollowedExpertsState>(
                        builder: (context, state) {
                          return state is FollowedExpertsSuccess
                              ? SizedBox(
                                  height: 150,
                                  child: ListView.separated(
                                    physics: const BouncingScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    itemCount:
                                        state.info.followedExperts!.length,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          CircleAvatar(
                                            radius: 45.0,
                                            child: ClipOval(
                                              child: CachedNetworkImage(
                                                imageUrl: imageUrl+state
                                                    .info
                                                    .followedExperts![index]
                                                    .image
                                                    .toString(),
                                                fit: BoxFit.cover,
                                                width: 80.0,
                                                height: 80.0,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 10.0),
                                          Text(
                                            state.info.followedExperts![index]
                                                .name
                                                .toString(),
                                            style: TextStyle(
                                              fontSize:
                                                  MyTextStyles.subTitleSize,
                                            ),
                                            softWrap: true,
                                            overflow: TextOverflow.visible,
                                          ),
                                        ],
                                      );
                                    },
                                    separatorBuilder:
                                        (BuildContext context, int index) {
                                      return const SizedBox(width: 20);
                                    },
                                  ),
                                )
                              : const SizedBox();
                        },
                      ),
                      const SizedBox(height: 25),
                      const Text(
                        "Followed Technologies:",
                        style: TextStyle(
                          fontSize: MyTextStyles.subTitleSize,
                        ),
                      ),
                      const SizedBox(height: 15),
                      BlocBuilder<FollowedTechnologiesCubit,
                          FollowedTechnologiesState>(
                        builder: (context, state) {
                          return state is FollowedTechnologiesSuccess
                              ? SizedBox(
                                  height: 200,
                                  child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemCount:
                                        state.info.followedTechnologies!.length,
                                    itemBuilder: (context, index) {
                                      return SizedBox(
                                        width: 200,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: CachedNetworkImage(
                                              imageUrl: imageUrl+state
                                                  .info
                                                  .followedTechnologies![index]
                                                  .image
                                                  .toString(),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    separatorBuilder:
                                        (BuildContext context, int index) {
                                      return const SizedBox(width: 20);
                                    },
                                  ),
                                )
                              : const SizedBox();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return const CustomLoadingItem();
          }
        },
      ),
    );
  }
}
