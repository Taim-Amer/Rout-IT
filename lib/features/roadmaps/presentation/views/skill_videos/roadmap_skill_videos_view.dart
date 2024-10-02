import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:route_it27/core/utils/constants/app_colors.dart';
import 'package:route_it27/core/utils/constants/assets_data.dart';
import 'package:route_it27/core/utils/constants/constants_numbers.dart';
import 'package:route_it27/core/utils/helpers/helper_functions.dart';
import 'package:route_it27/core/utils/router/app_router.dart';
import 'package:route_it27/features/roadmaps/presentation/view_models/skill_videos_cubit/skill_videos_cubit.dart';
import 'package:route_it27/features/roadmaps/presentation/views/skill_videos/widgets/video_card.dart';
import 'package:slide_to_act/slide_to_act.dart';

class SkillVideosView extends StatelessWidget {
  const SkillVideosView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SkillVideosCubit, SkillVideosState>(
        builder: (context, state) {
          if (state is SkillVideosLoaded) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.videos.length,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () => GoRouter.of(context).push(
                        AppRouter.kSkillVideoItem,
                        extra: state.videos[index],
                      ),
                      child: VideoCard(
                        title: state.videos[index].title!,
                        imagePath: AssetsData.welcomeImg,
                        category: "Programming",
                        progress: 0.25,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      right: HelperFunctions.screenHeight(context) *
                          horizintalMargin,
                      left: HelperFunctions.screenHeight(context) *
                          horizintalMargin,
                      bottom: HelperFunctions.screenHeight(context) *
                          horizintalMargin *
                          2),
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
                    text: " Slide to Test",
                    animationDuration: const Duration(milliseconds: 500),
                    submittedIcon: const CircularProgressIndicator(
                      backgroundColor: Colors.white,
                      color: AppColors.primaryColor,
                    ),
                    onSubmit: () {
                      print(
                          "this is our error ${state.videos[0].roadmapSkillId}");
                      GoRouter.of(context).push(AppRouter.kSkillTestView,
                          extra: state.videos[0].roadmapSkillId);
                      return;
                    },
                  ),
                ),
              ],
            );
          } else if (state is SkillVideosLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.whiteColor,
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.whiteColor,
              ),
            );
          }
        },
      ),
    );
  }
}
