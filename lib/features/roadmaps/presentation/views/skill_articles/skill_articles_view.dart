import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:route_it27/core/utils/constants/app_colors.dart';
import 'package:route_it27/core/utils/constants/assets_data.dart';
import 'package:route_it27/core/utils/constants/constants_numbers.dart';
import 'package:route_it27/core/utils/helpers/helper_functions.dart';
import 'package:route_it27/core/utils/router/app_router.dart';
import 'package:route_it27/features/roadmaps/presentation/view_models/skill_articles_cubit/skill_articles_cubit.dart';
import 'package:route_it27/features/roadmaps/presentation/views/skill_articles/widgets/article_card.dart';
import 'package:slide_to_act/slide_to_act.dart';

class SkillArticlesView extends StatelessWidget {
  const SkillArticlesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SkillArticlesCubit, SkillArticlesState>(
        builder: (context, state) {
          if (state is SkillArticlesLoaded) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.articles.length,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () => GoRouter.of(context).push(
                        AppRouter.kSkillArticeDetails,
                        extra: state.articles[index],
                      ),
                      child: ArticleCard(
                        title: state.articles[index].title!,
                        imagePath: AssetsData.welcomeImg,
                        author: "Rami Shaya",
                        category: "Programming",
                        categoryColor: AppColors.secondaryColor,
                        timeAgo: "2H 34 min",
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
                      GoRouter.of(context).push(AppRouter.kSkillTestView,
                          extra: state.articles[0].roadmapSkillId);
                      return;
                    },
                  ),
                ),
              ],
            );
          } else if (state is SkillArticlesLoading) {
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
