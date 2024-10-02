import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:route_it27/core/utils/constants/app_colors.dart';
import 'package:route_it27/core/utils/constants/assets_data.dart';
import 'package:route_it27/core/utils/constants/constants_numbers.dart';
import 'package:route_it27/core/utils/helpers/helper_functions.dart';
import 'package:route_it27/core/widgets/cached_network_image.dart';
import 'package:route_it27/core/widgets/custom_back_button2.dart';
import 'package:route_it27/core/widgets/custom_toast.dart';
import 'package:route_it27/features/competition/data/models/competition_model.dart';
import 'package:route_it27/features/competition/data/models/competitor_models.dart';
import 'package:route_it27/features/competition/presentation/view_models/add_project_link_cubit/add_project_link_cubit.dart';
import 'package:route_it27/features/competition/presentation/view_models/competition_register_cubit/competition_register_cubit.dart';
import 'package:route_it27/features/competition/presentation/view_models/competitor_cubit/competitor_cubit.dart';
import 'package:route_it27/features/competition/presentation/view_models/winners_cubit/winners_cubit.dart';
import 'package:route_it27/features/competition/presentation/views/competition_details/widgets/competitiors_list.dart';
import 'package:route_it27/features/competition/presentation/views/competition_details/widgets/compettion_time_widget.dart';
import 'package:slide_to_act/slide_to_act.dart';
// import 'package:slide_to_act/slide_to_act.dart';

class CompetitionDetails extends StatelessWidget {
  const CompetitionDetails({super.key, required this.competition});

  final Competitions competition;

  @override
  Widget build(BuildContext context) {
    final TextEditingController linkController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton2(),
        title: Text(
          competition.name!,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15,
              ),
              ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(25)),
                  child: CachedNetworkImg(
                      width: HelperFunctions.screenWidth(context),
                      height: HelperFunctions.screenHeight(context) * 0.25,
                      img: competition.image!,
                      placeHolder: AssetsData.placeHolderImg)),
              SizedBox(height: HelperFunctions.screenHeight(context) * 0.013),
              Card(
                elevation: 4,
                child: Container(
                  width: HelperFunctions.screenWidth(context) * 0.4,
                  height: HelperFunctions.screenHeight(context) * 0.07,
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.secondaryColor,
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: HelperFunctions.screenHeight(context) * 0.025,
                        backgroundImage: NetworkImage(
                          imageUrl +
                              competition.companyImage!, // URL of the image
                        ),
                        child: Image.network(
                          competition.companyImage!,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset(
                              AssetsData.avatarImg, // A local fallback image
                              fit: BoxFit.cover,
                            );
                          },
                        ),
                      ),
                      SizedBox(
                          width: HelperFunctions.screenWidth(context) * 0.02),
                      Expanded(
                        // This will prevent overflow
                        child: Text(
                          competition.companyName!,
                          style: const TextStyle(
                            color: AppColors.textOnPrimaryColor,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow
                                .ellipsis, // Ensure the text doesn't overflow
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: HelperFunctions.screenHeight(context) * 0.013),
              const Text(
                "Description",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: HelperFunctions.screenHeight(context) * 0.013),
              Text(competition.description!),
              SizedBox(height: HelperFunctions.screenHeight(context) * 0.03),
              CompetitionTimeWidget(
                startDate: DateTime.parse(competition.startDate!),
                endDate: DateTime.parse(competition.endDate!),
              ),
              SizedBox(height: HelperFunctions.screenHeight(context) * 0.03),
              const Text(
                "Competitors",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: HelperFunctions.screenHeight(context) * 0.013),
              BlocBuilder<CompetitorCubit, CompetitorState>(
                builder: (context, state) {
                  if (state is CompetitorLoaded) {
                    List<Competitor> competitors = state.competitor;
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.85,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                      ),
                      itemCount:
                          competitors.length >= 3 ? 4 : competitors.length + 1,
                      itemBuilder: (context, index) {
                        if (index == 3 ||
                            (competitors.length < 3 &&
                                index == competitors.length)) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CompetitorListScreen(
                                    competitors: competitors,
                                  ),
                                ),
                              );
                            },
                            child: Card(
                              color: AppColors.secondaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              elevation: 3,
                              child: const Center(
                                child: Text(
                                  'See All',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          );
                        } else {
                          return Card(
                            color: AppColors.secondaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            elevation: 3,
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 35,
                                    backgroundImage: NetworkImage(imageUrl +
                                        competitors[index].competitorImage!),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    competitors[index].competitorName!,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    'Competitor',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey[300],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }
                      },
                    );
                  } else if (state is CompetitorLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return Card(
                      color: AppColors.secondaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const CircleAvatar(
                              radius: 35,
                              backgroundImage: AssetImage(AssetsData.avatarImg),
                            ),
                            const SizedBox(height: 6),
                            const Text(
                              "there is no competitors",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 2),
                            Text(
                              '(:',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[300],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                },
              ),
              SizedBox(height: HelperFunctions.screenHeight(context) * 0.03),
              competition.isFinished!
                  ? Container()
                  : BlocConsumer<CompetitionRegisterCubit,
                      CompetitionRegisterState>(
                      listener: (context, state) {
                        if (state is CompetitionRegisterLoaded) {
                          showToast(state.registerCompetition.message ?? "",
                              ToastState.SUCCESS);
                        } else if (state is CompetitionRegisterFailure) {
                          showToast(state.errMessage, ToastState.ERROR);
                        }
                      },
                      builder: (context, state) {
                        if (state is CompetitionRegisterLoaded) {
                          return BlocConsumer<AddProjectLinkCubit,
                              AddProjectLinkState>(
                            listener: (context, state) {
                              if (state is AddProjectLinkSuccess) {
                                showToast(state.projectLinkModel.message ?? "",
                                    ToastState.SUCCESS);
                                BlocProvider.of<CompetitorCubit>(context)
                                    .fetchAllCompetitors(
                                        competionId: competition.id!);
                              } else if (state is AddProjectLinkFailure) {
                                showToast(state.errMessage, ToastState.ERROR);
                              }
                            },
                            builder: (context, state) {
                              if (state is AddProjectLinkLoading) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }
                              if (state is AddProjectLinkSuccess) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context)
                                        .viewInsets
                                        .bottom, // Adjust for keyboard
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        colors: [
                                          AppColors.primaryColor,
                                          AppColors.darkPrimaryColor
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ),
                                      borderRadius: BorderRadius.circular(25),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.2),
                                          spreadRadius: 3,
                                          blurRadius: 10,
                                          offset: const Offset(0, 5),
                                        ),
                                      ],
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0, vertical: 15.0),
                                    child: Row(
                                      children: [
                                        const Expanded(
                                            child: Text(
                                                "Link is Added,waiting for your progress")),
                                        const SizedBox(width: 10),
                                        Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            gradient: const LinearGradient(
                                              colors: [
                                                AppColors.secondaryColor,
                                                AppColors.primaryColor
                                              ],
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.3),
                                                spreadRadius: 2,
                                                blurRadius: 6,
                                                offset: const Offset(0, 3),
                                              ),
                                            ],
                                          ),
                                          padding: const EdgeInsets.all(12.0),
                                          child: const Icon(
                                            Icons.check_circle_outline_outlined,
                                            color: Colors.green,
                                            size: 30,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }

                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "project link",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 10),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      bottom: MediaQuery.of(context)
                                          .viewInsets
                                          .bottom, // Adjust for keyboard
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        gradient: const LinearGradient(
                                          colors: [
                                            AppColors.primaryColor,
                                            AppColors.darkPrimaryColor
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                        borderRadius: BorderRadius.circular(25),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.2),
                                            spreadRadius: 3,
                                            blurRadius: 10,
                                            offset: const Offset(0, 5),
                                          ),
                                        ],
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0, vertical: 15.0),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: TextField(
                                              controller: linkController,
                                              style: const TextStyle(
                                                  color: Colors.white),
                                              decoration: InputDecoration(
                                                filled: true,
                                                fillColor: AppColors
                                                    .secondaryColor
                                                    .withOpacity(0.1),
                                                hintText:
                                                    "Enter project link here",
                                                hintStyle: TextStyle(
                                                  color: Colors.grey[400],
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                contentPadding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 20.0,
                                                  vertical: 15.0,
                                                ),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  borderSide: BorderSide.none,
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  borderSide: BorderSide.none,
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  borderSide: BorderSide.none,
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          GestureDetector(
                                            onTap: () {
                                              BlocProvider.of<
                                                          AddProjectLinkCubit>(
                                                      context)
                                                  .addProjectLink(
                                                competitionId: competition.id!,
                                                projectLink:
                                                    linkController.text,
                                              );
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                gradient: const LinearGradient(
                                                  colors: [
                                                    AppColors.secondaryColor,
                                                    AppColors.primaryColor
                                                  ],
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight,
                                                ),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black
                                                        .withOpacity(0.3),
                                                    spreadRadius: 2,
                                                    blurRadius: 6,
                                                    offset: const Offset(0, 3),
                                                  ),
                                                ],
                                              ),
                                              padding:
                                                  const EdgeInsets.all(12.0),
                                              child: const Icon(
                                                Iconsax.send1,
                                                color: Colors.white,
                                                size: 30,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              );
                            },
                          );
                        } else {
                          return Center(
                            child: SlideAction(
                              sliderButtonIconPadding: 20,
                              sliderButtonIconSize: 20,
                              elevation: 4,
                              outerColor: AppColors.primaryColor,
                              innerColor: AppColors.darkPrimaryColor,
                              sliderButtonIcon: const Icon(
                                color: Colors.white,
                                Icons.arrow_circle_right,
                                size: 30,
                              ),
                              text: "Slide to Register",
                              animationDuration:
                                  const Duration(milliseconds: 500),
                              submittedIcon: const CircularProgressIndicator(
                                backgroundColor: Colors.white,
                                color: AppColors.primaryColor,
                              ),
                              onSubmit: () {
                                BlocProvider.of<CompetitionRegisterCubit>(
                                        context)
                                    .registerCompettion(
                                        competitionId: competition.id!);
                                return;
                              },
                            ),
                          );
                        }
                      },
                    ),
              SizedBox(height: HelperFunctions.screenHeight(context) * 0.013),
              competition.isFinished!
                  ? const Text(
                      "Competition winners",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  : Container(),
              SizedBox(height: HelperFunctions.screenHeight(context) * 0.013),
              BlocBuilder<WinnersCubit, WinnersState>(
                builder: (context, state) {
                  if (state is WinnersLoaded) {
                    final winners = state.winnersModel.winners!;
                    return Padding(
                      padding: EdgeInsets.all(
                          HelperFunctions.screenWidth(context) *
                              horizintalMargin),
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.secondaryColor
                              .withOpacity(0.3), // Background color
                          borderRadius:
                              BorderRadius.circular(15), // Rounded corners
                          border: Border.all(
                              color: Colors.white, width: 0.5), // Outer border
                        ),
                        child: Table(
                          columnWidths: const {
                            0: IntrinsicColumnWidth(),
                            1: FlexColumnWidth(),
                          },
                          defaultVerticalAlignment:
                              TableCellVerticalAlignment.middle,
                          children: winners.map((winner) {
                            return TableRow(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 12.0),
                                  child: CircleAvatar(
                                    radius: 28,
                                    backgroundColor: AppColors.secondaryColor,
                                    child: CircleAvatar(
                                      radius: 25,
                                      backgroundImage: NetworkImage(
                                        imageUrl+
                                        winner.image! 
                                            
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 12.0, horizontal: 8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        winner.name ?? 'Unknown',
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        winner.university ??
                                            'Unknown University',
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.white.withOpacity(0.1),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 4, horizontal: 8),
                                        child: Text(
                                          'Rank: ${winner.rank}',
                                          style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          }).toList(),
                        ),
                      ),
                    );
                  } else if (state is WinnersLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return const Center(
                      child: Text(
                        "No winners yet",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
