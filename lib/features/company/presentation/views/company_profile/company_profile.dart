// ignore_for_file: avoid_unnecessary_containers

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:route_it27/core/utils/constants/app_colors.dart';
import 'package:route_it27/core/utils/constants/constants_numbers.dart';
import 'package:route_it27/core/utils/helpers/helper_functions.dart';
import 'package:route_it27/core/widgets/custom_back_button2.dart';
import 'package:route_it27/features/company/presentation/view_models/comapny_profile_cubit/company_profile_cubit.dart';

class CompanyProfile extends StatelessWidget {
  const CompanyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton2(),
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(
              HelperFunctions.screenWidth(context) * horizintalMargin),
          child: BlocBuilder<CompanyProfileCubit, CompanyProfileState>(
            builder: (context, state) {
              if (state is CompanyProfileLoaded) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      color: AppColors.secondaryColor.withOpacity(0.2),
                      elevation: 5.0,
                      child: Padding(
                        padding: EdgeInsets.all(
                            HelperFunctions.screenWidth(context) *
                                horizintalMargin),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(70),
                                border: Border.all(
                                  color:
                                      AppColors.secondaryColor.withOpacity(0.4),
                                  width: 3.0,
                                ),
                              ),
                              child: ClipOval(
                                child: CachedNetworkImage(
                                  imageUrl: imageUrl +
                                      state.companyProfileModel.company!.image!,
                                  width: HelperFunctions.screenHeight(context) *
                                      0.13,
                                  height:
                                      HelperFunctions.screenHeight(context) *
                                          0.13,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                                height: HelperFunctions.screenHeight(context) *
                                    0.01),
                            Text(
                              state.companyProfileModel.company!.name!,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                                height: HelperFunctions.screenHeight(context) *
                                    0.003),
                            Text(
                              state.companyProfileModel.company!.email!,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(color: Colors.grey[400]),
                            ),
                            SizedBox(
                                height: HelperFunctions.screenHeight(context) *
                                    0.003),
                            Row(
                              children: [
                                Text(
                                  state.companyProfileModel.company!.location!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(color: Colors.grey[400]),
                                ),
                                SizedBox(
                                    width:
                                        HelperFunctions.screenWidth(context) *
                                            0.015),
                                const Icon(
                                  Iconsax.location,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                            SizedBox(
                                height: HelperFunctions.screenHeight(context) *
                                    0.003),
                            Text(
                              state.companyProfileModel.company!.description!,
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "Competitions",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    // Ensure ListView.builder is properly constrained
                    Column(
                      children: List.generate(
                        state.companyProfileModel.company!.competitions!.length,
                        (index) {
                          return Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            color: AppColors.secondaryColor.withOpacity(0.2),
                            elevation: 5.0,
                            child: Padding(
                              padding: EdgeInsets.all(
                                  HelperFunctions.screenWidth(context) *
                                      horizintalMargin),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: AppColors.primaryColor,
                                                width: 2.0,
                                              ),
                                            ),
                                            child: ClipOval(
                                              child: CachedNetworkImage(
                                                imageUrl: imageUrl +
                                                    state.companyProfileModel
                                                        .company!.image!,
                                                width: HelperFunctions
                                                        .screenHeight(context) *
                                                    0.05,
                                                height: HelperFunctions
                                                        .screenHeight(context) *
                                                    0.05,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                              width:
                                                  HelperFunctions.screenWidth(
                                                          context) *
                                                      0.03),
                                          Text(
                                            state.companyProfileModel.company!
                                                .name!,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineSmall!
                                                .copyWith(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                      height: HelperFunctions.screenHeight(
                                              context) *
                                          0.01),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20.0),
                                      child: SizedBox(
                                          height: HelperFunctions.screenHeight(
                                                  context) *
                                              0.3,
                                          child: CachedNetworkImage(
                                              width:
                                                  HelperFunctions.screenWidth(
                                                          context) *
                                                      0.9,
                                              fit: BoxFit.cover,
                                              imageUrl: imageUrl +
                                                  state
                                                      .companyProfileModel
                                                      .company!
                                                      .competitions![index]
                                                      .image!)),
                                    ),
                                  ),
                                  SizedBox(
                                      height: HelperFunctions.screenHeight(
                                              context) *
                                          0.01),
                                  Text(
                                    state.companyProfileModel.company!
                                        .competitions![index].name!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                      height: HelperFunctions.screenHeight(
                                              context) *
                                          0.003),
                                  Text(
                                    state.companyProfileModel.company!
                                        .competitions![index].description!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}
