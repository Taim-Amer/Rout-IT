import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:route_it27/core/utils/router/app_router.dart';
import 'package:route_it27/features/home/presentation/views/widgets/category_card.dart';

import '../../../data/models/technology_category_model.dart';

class GridCardsBuilder extends StatelessWidget {
  const GridCardsBuilder(
      {super.key, required this.size, required this.categoriesList});

  final List<TechnologyCategoryModel> categoriesList;

  final Size size;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 4,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: size.width * 0.035,
        mainAxisSpacing: size.width * 0.035,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            if (index == 3) {
              GoRouter.of(context)
                  .push(AppRouter.kTechCategoryView, extra: categoriesList);
            }
            if (index == 0 || index == 1 || index == 2) {
              GoRouter.of(context).push(AppRouter.kTechnologyDetailsView,
                  extra: categoriesList[index]);
            }
          },
          child: CategoryCard(
            technologyCategoryModel: categoriesList,
            size: size,
            index: index,
          ),
        );
      },
    );
  }
}
