import 'package:flutter/material.dart';
import 'package:route_it27/core/utils/constants/constants_numbers.dart';
import 'package:route_it27/core/utils/constants/app_colors.dart';
import 'package:route_it27/core/utils/constants/assets_data.dart';
import 'package:route_it27/features/home/data/models/technology_category_model.dart';
import 'package:route_it27/features/home/presentation/views/widgets/categories_builder.dart';
import 'package:route_it27/core/widgets/custom_sliver_app_bar.dart';

class TechnologyCategoryView extends StatelessWidget {
  const TechnologyCategoryView({super.key, required this.categoriesList});
  final List<TechnologyCategoryModel> categoriesList;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: AppColors.darkPrimaryColor,
        extendBodyBehindAppBar: true,
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            CustomSliverAppBar(
              size: size,
              img: AssetsData.welcomeImg,
              title: "Explore Technologies",
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * horizintalMargin),
                child: SizedBox(
                  child: CategoriesBuilder(
                    size: size,
                    categoriesList: categoriesList,
                  ),
                ),
              )
            ]))
          ],
        ));
  }
}
