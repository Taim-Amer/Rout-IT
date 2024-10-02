import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:route_it27/core/utils/constants/app_colors.dart';
import 'package:route_it27/core/utils/constants/constants_numbers.dart';
import 'package:route_it27/core/utils/router/app_router.dart';
import 'package:route_it27/core/utils/styles/app_styles.dart';
import 'package:route_it27/core/utils/constants/assets_data.dart';
import 'package:route_it27/core/widgets/custom_loading_animation.dart';
import 'dart:math' as math;

import 'package:route_it27/features/home/data/models/technology_category_model.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard(
      {super.key,
      required this.size,
      required this.index,
      required this.technologyCategoryModel});
  final int index;
  final Size size;
  final List<TechnologyCategoryModel> technologyCategoryModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(25)),
        color: AppColors.cardColors[index],
      ),
      child: Stack(
        clipBehavior: Clip.antiAlias,
        children: [
          Positioned(
            top: size.height * 0.01,
            left: size.width * 0.02,
            child: Transform.rotate(
              angle: -math.pi / 7,
              child: Opacity(
                  opacity: 0.1,
                  child: index == 3
                      ? Image.asset(
                          width: size.width * 0.40,
                          height: size.width * 0.40,
                          AssetsData.categoryImg2,
                        )
                      : CachedNetworkImage(
                          width: size.width * 0.40,
                          height: size.width * 0.40,
                          imageUrl: imageUrl+technologyCategoryModel[index].image!,
                          fit: BoxFit.cover,
                        )),
            ),
          ),
          Positioned(
            left: size.width * 0.1,
            right: size.width * 0.1,
            top: size.width * 0.07,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                index == 3
                    ? Image.asset(
                        width: size.width * 0.20,
                        height: size.width * 0.20,
                        AssetsData.categoryImg2,
                        fit: BoxFit.cover,
                      )
                    : CachedNetworkImage(
                        width: size.width * 0.20,
                        height: size.width * 0.20,
                        imageUrl: imageUrl+technologyCategoryModel[index].image!,
                        fit: BoxFit.cover,
                        placeholder: (context, url) {
                          return Center(child: Container());
                        },
                      ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                index == 3
                    ? const Text(
                        "Explore",
                        style: TextStyle(fontSize: MyTextStyles.subTitleSize),
                      )
                    : Text(
                        "${technologyCategoryModel[index].name}",
                        style: const TextStyle(fontSize: 15),
                      )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
