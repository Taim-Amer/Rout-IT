import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:route_it27/core/utils/constants/constants_numbers.dart';
import 'package:route_it27/core/utils/constants/app_colors.dart';
import 'package:route_it27/core/utils/router/app_router.dart';

import 'dart:math' as math;

import 'package:route_it27/features/home/data/models/technology_category_model.dart';

class TechCategoryCard extends StatelessWidget {
  const TechCategoryCard(
      {super.key,
      required this.size,
      required this.category,
      required this.index});

  final Size size;
  final int index;

  final TechnologyCategoryModel category;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context)
            .push(AppRouter.kTechnologyDetailsView, extra: category);
      },
      child: Container(
        width: size.width,
        height: size.height * 0.13,
        decoration: BoxDecoration(
            color: AppColors.cardColors[index % AppColors.cardColors.length],
            borderRadius: BorderRadius.circular(15)),
        margin: EdgeInsets.only(bottom: size.width * 0.05),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 20,
              child: Transform.rotate(
                angle: -math.pi / 7,
                child: Opacity(
                  opacity: 0.1,
                  child: CachedNetworkImage(
                      width: size.width * 0.40,
                      height: size.width * 0.40,
                      imageUrl: imageUrl+ category.image!),
                ),
              ),
            ),
            Positioned(
              right: size.width * horizintalMargin,
              bottom: size.height * 0.01,
              child: CachedNetworkImage(
                width: size.width * 0.20,
                height: size.width * 0.20,
                imageUrl: imageUrl+category.image!,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
                bottom: size.height * 0.04,
                left: size.width * horizintalMargin,
                child: Text(
                  category.name!,
                  style: const TextStyle(fontSize: 24),
                ))
          ],
        ),
      ),
    );
  }
}
