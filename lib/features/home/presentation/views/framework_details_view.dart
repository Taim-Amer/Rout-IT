import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:route_it27/core/utils/constants/constants_numbers.dart';
import 'package:route_it27/core/utils/constants/app_colors.dart';
import 'package:route_it27/core/utils/router/app_router.dart';
import 'package:route_it27/core/utils/styles/app_styles.dart';
import 'package:route_it27/core/utils/constants/assets_data.dart';
import 'package:route_it27/core/widgets/custom_back_button2.dart';
import 'package:route_it27/core/widgets/custom_error_item.dart';
import 'package:route_it27/core/widgets/custom_expandable_text.dart';
import 'package:route_it27/features/home/data/models/level_model.dart';
import 'package:route_it27/features/home/data/models/technologies_model.dart';
import 'package:route_it27/features/home/presentation/view_models/level_cubit/level_cubit.dart';
import 'package:route_it27/features/home/presentation/views/widgets/level_card.dart';

import 'widgets/level_cards_shimmer.dart';

class FrameWorkDetailsView extends StatelessWidget {
  const FrameWorkDetailsView({super.key, required this.technologiesModel});
  final TechnologiesModel technologiesModel;

  @override
  Widget build(BuildContext context) {
    List<String> myLevels = ["Beginner", "Mid-Level", "Advanced"];
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.darkPrimaryColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  child: SizedBox(
                    width: size.width,
                    height: size.height * 0.25,
                    child: Hero(
                      tag: technologiesModel.id!,
                      child: CachedNetworkImage(
                        width: size.width,
                        height: size.width * 0.20,
                        imageUrl: imageUrl + technologiesModel.image!,
                        fit: BoxFit.fill,
                        placeholder: (context, url) => Image.asset(
                          AssetsData.placeHolderImg,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                    top: size.height * 0.057,
                    left: size.width * horizintalMargin,
                    child: CircleAvatar(
                        backgroundColor:
                            AppColors.lightPrimaryColor.withOpacity(0.35),
                        child: const Center(child: CustomBackButton2())))
              ],
            ),
            Padding(
              padding: EdgeInsets.all(size.width * horizintalMargin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    technologiesModel.name!,
                    style: const TextStyle(fontSize: MyTextStyles.titleSize),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  CustomExpandableText(content: technologiesModel.description),
                  SizedBox(height: size.height * 0.008),
                  const Text(
                    "Choose Your Level",
                    style: TextStyle(
                        fontSize: MyTextStyles.titleSize,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  const Text(
                    "We are Preparing Special RoadMaps for you",
                    style: TextStyle(fontSize: MyTextStyles.subTitleSize),
                  ),
                  BlocBuilder<LevelCubit, LevelState>(
                    builder: (context, state) {
                      if (state is LevelLoaded) {
                        List<LevelModel> levels = state.levels;
                        return SizedBox(
                          height: (size.height * 0.13) * 3.75,
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: levels.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  GoRouter.of(context).push(
                                      AppRouter.kRoadmapsView,
                                      extra: levels[index]);
                                },
                                child: LevelCard(
                                    size: size,
                                    levels: [
                                      LevelModel(level: "Begginer"),
                                      LevelModel(level: "Mid-Level"),
                                      LevelModel(level: "Advanced")
                                    ],
                                    index: index),
                              );
                            },
                          ),
                        );
                      } else if (state is LevelFailure) {
                        return CustomErrorItem(
                          errorMessage: state.errMessage,
                        );
                      } else {
                        return
                            // Container();
                            LevelCardsShimmer(size: size);
                      }
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
