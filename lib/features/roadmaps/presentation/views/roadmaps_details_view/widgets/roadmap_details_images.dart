import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_it27/core/utils/constants/app_colors.dart';
import 'package:route_it27/core/utils/constants/assets_data.dart';
import 'package:route_it27/core/utils/helpers/helper_functions.dart';
import 'package:route_it27/core/widgets/cached_network_image.dart';
import 'package:route_it27/features/roadmaps/data/models/roadmap_model.dart';
import 'package:route_it27/features/roadmaps/presentation/view_models/page_index_cubit/page_index_cubit.dart';
import 'package:route_it27/features/roadmaps/presentation/view_models/video_player_cubit/video_player_cubit.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:video_player/video_player.dart';

class RoadMapDetailsMedia extends StatelessWidget {
  const RoadMapDetailsMedia({
    super.key,
    required this.roadMapModel,
  });

  final RoadMapModel roadMapModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          VideoPlayerCubit("https://youtu.be/rIfdg_Ot-LI?si=RTYfGcH81iwDevK8")
            ..initializeVideoPlayer(),
      child: BlocBuilder<PageIndexCubit, int>(
        builder: (context, pageIndex) {
          final pageController =
              BlocProvider.of<PageIndexCubit>(context).pageController;
          return Padding(
            padding: EdgeInsets.symmetric(
                vertical: HelperFunctions.screenHeight(context) * 0.03),
            child: Column(
              children: [
                SizedBox(
                  height: HelperFunctions.screenHeight(context) * 0.25,
                  child: PageView(
                    controller: pageController,
                    onPageChanged: (index) {
                      BlocProvider.of<PageIndexCubit>(context)
                          .setPageIndex(index);
                    },
                    children: [
                      // BlocBuilder<VideoPlayerCubit, VideoPlayerState>(
                      //   builder: (context, state) {
                      //     if (state.isControllerInitialized) {
                      //       return Padding(
                      //         padding: EdgeInsets.only(
                      //             right: HelperFunctions.screenWidth(context) *
                      //                 0.02),
                      //         child: ClipRRect(
                      //             borderRadius: const BorderRadius.all(
                      //                 Radius.circular(35)),
                      //             child: SizedBox(
                      //               width: HelperFunctions.screenWidth(context),
                      //               height:
                      //                   HelperFunctions.screenHeight(context) *
                      //                       0.25,
                      //               child: VideoPlayer(
                      //                   state.videoPlayerController),
                      //             )),
                      //       );
                      //     } else {
                      //       return Padding(
                      //         padding: EdgeInsets.only(
                      //             left: HelperFunctions.screenWidth(context) *
                      //                 0.02),
                      //         child: ClipRRect(
                      //             borderRadius: const BorderRadius.all(
                      //                 Radius.circular(35)),
                      //             child: Container(
                      //               color: AppColors.secondaryColor,
                      //               width: HelperFunctions.screenWidth(context),
                      //               height:
                      //                   HelperFunctions.screenHeight(context) *
                      //                       0.25,
                      //               child: const SizedBox(
                      //                 width: 5,
                      //                 height: 5,
                      //                 child: CircularProgressIndicator()),
                      //             )),
                      //       );
                      //     }
                      //   },
                      // ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: HelperFunctions.screenWidth(context) * 0.02),
                        child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(35)),
                            child: CachedNetworkImg(
                                width: HelperFunctions.screenWidth(context),
                                height: HelperFunctions.screenHeight(context) *
                                    0.25,
                                img: roadMapModel.cover!,
                                placeHolder: AssetsData.placeHolderImg)),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: HelperFunctions.screenHeight(context) * 0.02,
                ),
                SmoothPageIndicator(
                  controller: pageController,
                  count: 2,
                  effect: const WormEffect(
                    dotHeight: 8,
                    dotWidth: 8,
                    activeDotColor: AppColors.secondaryColor,
                    dotColor: AppColors.lightPrimaryColor,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
