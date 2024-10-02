import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:route_it27/core/utils/constants/app_colors.dart';
import 'package:route_it27/core/utils/constants/assets_data.dart';
import 'package:route_it27/core/utils/constants/constants_numbers.dart';
import 'package:route_it27/core/utils/helpers/helper_functions.dart';
import 'package:route_it27/core/utils/router/app_router.dart';
import 'package:route_it27/core/utils/styles/app_styles.dart';
import 'package:route_it27/features/competition/data/models/competition_model.dart';
import 'package:route_it27/features/competition/presentation/view_models/competitions_cubit/competitions_cubit.dart';

class CompetitionsView extends StatefulWidget {
  const CompetitionsView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CompetitionsViewState createState() => _CompetitionsViewState();
}

class _CompetitionsViewState extends State<CompetitionsView> {
  String selectedCompetition = 'current Competition';
  final List<String> competitionOptions = [
    'current Competition',
    'previous Competitions',
    'upcoming Competitions',
    'all Competitions'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(
              HelperFunctions.screenWidth(context) * horizintalMargin),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Our Competitions", style: MyTextStyles.titleStyle),
                  ],
                ),
                SizedBox(height: HelperFunctions.screenHeight(context) * 0.02),
                DropdownButton<String>(
                  dropdownColor: AppColors.primaryColor,
                  value: selectedCompetition,
                  icon: const Icon(Icons.arrow_drop_down),
                  elevation: 16,
                  style: const TextStyle(
                    color: AppColors.textOnPrimaryColor,
                    fontSize: MyTextStyles.subTitleSize,
                  ),
                  underline: Container(
                    height: 2,
                    color: AppColors.primaryColor,
                  ),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      setState(() {
                        selectedCompetition = newValue;
                      });
                      String queryParam = newValue.split(' ')[0].toLowerCase();
                      BlocProvider.of<CompetitionsCubit>(context)
                          .fetchCompetitions(queryParam);
                    }
                  },
                  items: competitionOptions.map<DropdownMenuItem<String>>(
                    (String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    },
                  ).toList(),
                ),
                SizedBox(
                  height: HelperFunctions.screenHeight(context) * 0.02,
                ),
                BlocBuilder<CompetitionsCubit, CompetitionsState>(
                  builder: (context, state) {
                    if (state is CompetitionsLoaded) {
                      List<Competitions> competitions = state.competitions;
                      return ListView.builder(
                        itemCount: competitions.length,
                        scrollDirection: Axis.vertical,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Card(
                            color: AppColors.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            elevation: 5,
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                      ),
                                      child: SizedBox(
                                        width: double.infinity,
                                        height: HelperFunctions.screenHeight(
                                                context) *
                                            0.29,
                                      ),
                                    ),
                                    ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                        ),
                                        child: CachedNetworkImage(
                                          imageUrl: imageUrl +
                                              competitions[index].image!,
                                          fit: BoxFit.cover,
                                          width: double.infinity,
                                          height: HelperFunctions.screenHeight(
                                                  context) *
                                              0.25,
                                        )),
                                    Positioned(
                                      top: HelperFunctions.screenHeight(
                                              context) *
                                          0.21,
                                      left:
                                          HelperFunctions.screenWidth(context) *
                                              horizintalMargin,
                                      child: GestureDetector(
                                        onTap: () => GoRouter.of(context).push(
                                            AppRouter.kCompanyProfile,
                                            extra:
                                                competitions[index].companyId),
                                        child: Card(
                                          elevation: 4,
                                          child: Container(
                                            width: HelperFunctions.screenWidth(
                                                    context) *
                                                0.4,
                                            height:
                                                HelperFunctions.screenHeight(
                                                        context) *
                                                    0.07,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: AppColors.secondaryColor,
                                            ),
                                            child: Row(
                                              children: [
                                                CircleAvatar(
                                                  radius: HelperFunctions
                                                          .screenHeight(
                                                              context) *
                                                      0.025,
                                                  backgroundImage: NetworkImage(
                                                    imageUrl +
                                                        competitions[index]
                                                            .companyImage!,
                                                  ),
                                                ),
                                                SizedBox(
                                                    width: HelperFunctions
                                                            .screenWidth(
                                                                context) *
                                                        0.02),
                                                Expanded(
                                                  // This will prevent overflow
                                                  child: Text(
                                                    competitions[index]
                                                        .companyName!,
                                                    style: const TextStyle(
                                                      color: AppColors
                                                          .textOnPrimaryColor,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      overflow: TextOverflow
                                                          .ellipsis, // Ensure the text doesn't overflow
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top:
                                          HelperFunctions.screenWidth(context) *
                                              horizintalMargin /
                                              2,
                                      left:
                                          HelperFunctions.screenWidth(context) *
                                              horizintalMargin,
                                      right:
                                          HelperFunctions.screenWidth(context) *
                                              horizintalMargin,
                                      bottom:
                                          HelperFunctions.screenWidth(context) *
                                              horizintalMargin),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        competitions[index].name!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        softWrap: true,
                                        textAlign: TextAlign.start,
                                      ),
                                      SizedBox(
                                          height: HelperFunctions.screenHeight(
                                                  context) *
                                              0.01),
                                      Row(
                                        children: [
                                          const Icon(Iconsax.clock),
                                          SizedBox(
                                              width:
                                                  HelperFunctions.screenHeight(
                                                          context) *
                                                      0.01),
                                          Column(
                                            children: [
                                              Text(
                                                "${competitions[index].startDate}",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineSmall,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                softWrap: true,
                                                textAlign: TextAlign.start,
                                              ),
                                              Text(
                                                "${competitions[index].endDate}",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineSmall,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                softWrap: true,
                                                textAlign: TextAlign.start,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                          height: HelperFunctions.screenHeight(
                                                  context) *
                                              0.01),
                                      Text(
                                        competitions[index].description!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        softWrap: true,
                                        textAlign: TextAlign.start,
                                      ),
                                      SizedBox(
                                          height: HelperFunctions.screenHeight(
                                                  context) *
                                              0.02),
                                      SizedBox(
                                        width: double.infinity,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            GoRouter.of(context).push(
                                                AppRouter.kCompetitionsDetails,
                                                extra: competitions[index]);
                                          },
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  AppColors.secondaryColor,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20))),
                                          child: const Text("Details"),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    } else if (state is CompetitionsLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return const Center(
                        child: Text("There are no competitions"),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
