import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:route_it27/core/utils/constants/app_colors.dart';
import 'package:route_it27/core/utils/constants/constants_numbers.dart';
import 'package:route_it27/core/utils/helpers/helper_functions.dart';
import 'package:route_it27/core/utils/local_storage/cache_services.dart';
import 'package:route_it27/core/utils/router/app_router.dart';
import 'package:route_it27/core/utils/styles/app_styles.dart';
import 'package:route_it27/features/user/data/models/my_competitions_model.dart';

import 'package:route_it27/features/user/presentation/view_model/followed_companies_cubit/followd_companies_cubit.dart';
import 'package:route_it27/features/user/presentation/view_model/followed_experts_cubit/followed_experts_cubit.dart';
import 'package:route_it27/features/user/presentation/view_model/followed_technologies_cubit/followed_technologies_cubit.dart';
import 'package:route_it27/features/user/presentation/view_model/my_competitions_cubit/my_competitions_cubit.dart';
import 'package:route_it27/features/user/presentation/view_model/profile_cubit/profile_cubit.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(builder: (context, state) {
      if (state is ProfileLoaded) {
        return SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal:
                  HelperFunctions.screenWidth(context) * horizintalMargin,
              vertical:
                  HelperFunctions.screenHeight(context) * horizintalMargin,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 55.0,
                      backgroundColor: Colors.blueGrey[100],
                      backgroundImage:
                          NetworkImage(imageUrl + state.myProfile.user!.image!),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      state.myProfile.user!.name!,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.visible,
                    ),
                  ],
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
                        state.myProfile.user!.email!,
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
                        state.myProfile.user!.university!,
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
                        state.myProfile.user!.birthDate!,
                        style: const TextStyle(
                          fontSize: MyTextStyles.subTitleSize,
                        ),
                        softWrap: true,
                        overflow: TextOverflow.visible,
                      ),
                    ),
                  ],
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    _showLogoutDialog(context);
                  },
                  icon: const Icon(Iconsax.logout, color: Colors.white),
                  label: const Text(
                    'Logout',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.darkPrimaryColor,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 5,
                  ),
                ),
                // Other profile details (name, email, etc.)
                BlocBuilder<MyCompetitionsCubit, MyCompetitionsState>(
                  builder: (context, state) {
                    if (state is MyCompetitionsLoaded) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 15),
                          const Text("My Competitions",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 15),
                          _buildCompetitionsList(
                              state.myCompetitionModel.competitions!),
                          // const SizedBox(height: 30),
                          // const Text("Followed Technologies",
                          //     style: TextStyle(
                          //         fontSize: 20, fontWeight: FontWeight.bold)),
                          // const SizedBox(height: 15),
                          // _buildFollowedTechnologiesList(context),
                          const SizedBox(height: 30),
                          const Text("Followed Companies",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 15),
                          _buildFollowedCompaniesList(context),
                          const SizedBox(height: 30),
                          const Text("Followed Experts",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 15),
                          _buildFollowedExpertsList(context),
                        ],
                      );
                    } else if (state is MyCompetitionsLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return Container();
                    }
                  },
                ),
              ],
            ),
          ),
        );
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    });
  }



  Widget _buildCompetitionsList(List<Competitions> competitions) {
    return SizedBox(
      height: 250,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: competitions.length,
        itemBuilder: (context, index) {
          return _buildCompetitionCard(competitions[index]);
        },
        separatorBuilder: (context, index) {
          return const SizedBox(width: 20);
        },
      ),
    );
  }

  Widget _buildCompetitionCard(Competitions competition) {
    final DateFormat dateFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
    return Container(
      width: 200,
      decoration: BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            child: CachedNetworkImage(
              imageUrl: imageUrl + competition.image!,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  competition.name!,
                  style: const TextStyle(
                    fontSize: MyTextStyles.subTitleSize,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Icon(Iconsax.calendar, size: 16, color: Colors.green),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        "Starts: ${dateFormat.format(DateTime.parse(competition.startDate!))}",
                        style: const TextStyle(
                            fontSize: MyTextStyles.subTitleSize),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 3),
                Row(
                  children: [
                    const Icon(Iconsax.calendar, size: 16, color: Colors.red),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        "Ends: ${dateFormat.format(DateTime.parse(competition.endDate!))}",
                        style: const TextStyle(
                            fontSize: MyTextStyles.subTitleSize),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget _buildFollowedTechnologiesList(BuildContext context) {
  //   return BlocBuilder<FollowedTechnologiesCubit, FollowedTechnologiesState>(
  //     builder: (context, state) {
  //       if (state is FollowedTechnologiesLoading) {
  //         return const Center(child: CircularProgressIndicator());
  //       } else if (state is FollowedTechnologiesSuccess) {
  //         return SizedBox(
  //           height: HelperFunctions.screenHeight(context) * 0.17,
  //           child: ListView.separated(
  //             scrollDirection: Axis.horizontal,
  //             itemCount: state.info.followedTechnologies?.length ?? 0,
  //             itemBuilder: (context, index) {
  //               var technology = state.info.followedTechnologies![index];
  //               return _buildCard(technology.name!, technology.image!);
  //             },
  //             separatorBuilder: (context, index) {
  //               return const SizedBox(width: 20);
  //             },
  //           ),
  //         );
  //       } else {
  //         return const Center(
  //             child: Text('Failed to load followed technologies'));
  //       }
  //     },
  //   );
  // }

  Widget _buildFollowedCompaniesList(BuildContext context) {
    return BlocBuilder<FollowedCompaniesCubit, FollowedCompaniesState>(
      builder: (context, state) {
        if (state is FollowedCompaniesLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is FollowedCompaniesSuccess) {
          return SizedBox(
            height: HelperFunctions.screenHeight(context) * 0.17,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount:
                  state.followedCompaniesModel.followedCompanies?.length ?? 0,
              itemBuilder: (context, index) {
                var company =
                    state.followedCompaniesModel.followedCompanies![index];
                return _buildCard(company.name!, company.image!);
              },
              separatorBuilder: (context, index) {
                return const SizedBox(width: 20);
              },
            ),
          );
        } else {
          return const Center(child: Text('Failed to load followed companies'));
        }
      },
    );
  }

  Widget _buildFollowedExpertsList(BuildContext context) {
    return BlocBuilder<FollowedExpertsCubit, FollowedExpertsState>(
      builder: (context, state) {
        if (state is FollowedExpertsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is FollowedExpertsSuccess) {
          return SizedBox(
            height: HelperFunctions.screenHeight(context) * 0.17,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: state.info.followedExperts?.length ?? 0,
              itemBuilder: (context, index) {
                var expert = state.info.followedExperts![index];
                return _buildCard(expert.name!, expert.image!);
              },
              separatorBuilder: (context, index) {
                return const SizedBox(width: 20);
              },
            ),
          );
        } else {
          return const Center(child: Text('Failed to load followed experts'));
        }
      },
    );
  }

  Widget _buildCard(String title, String imageUr) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: CachedNetworkImage(
            imageUrl: imageUrl + imageUr,
            height: 80,
            width: 80,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.secondaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text(
            'Log Out',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: const Text(
            'Are you sure you want to log out?',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text(
                'Cancel',
                style: TextStyle(
                  color: AppColors.darkPrimaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Perform logout
                CacheServices.removeData(key: "token");
                GoRouter.of(context).pushReplacement(AppRouter.kLoginView);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.darkPrimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Logout',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
