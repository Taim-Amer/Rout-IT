import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:route_it27/features/home/data/models/technology_category_model.dart';
import 'package:route_it27/features/home/presentation/views/widgets/tech_category_card.dart';

class CategoriesBuilder extends StatelessWidget {
  const CategoriesBuilder(
      {super.key, required this.size, required this.categoriesList});

  final List<TechnologyCategoryModel> categoriesList;

  final Size size;

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
        child: ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: categoriesList.length,
      itemBuilder: (context, index) {
        return AnimationConfiguration.staggeredList(
            position: index,
            delay: const Duration(milliseconds: 100),
            child: SlideAnimation(
                duration: const Duration(milliseconds: 2500),
                curve: Curves.fastLinearToSlowEaseIn,
                horizontalOffset: 30,
                verticalOffset: 300.0,
                child: FlipAnimation(
                    duration: const Duration(milliseconds: 3000),
                    curve: Curves.fastLinearToSlowEaseIn,
                    flipAxis: FlipAxis.y,
                    child: TechCategoryCard(
                      size: size,
                      category: categoriesList[index],
                      index: index,
                    ))));
      },
    ));
  }
}
