
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:route_it27/core/utils/constants/app_colors.dart';

class CustomBackButton2 extends StatelessWidget {
  const CustomBackButton2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
    splashColor: AppColors.lightPrimaryColor,
    highlightColor: AppColors.lightPrimaryColor,
    focusColor: AppColors.lightPrimaryColor,
    borderRadius: BorderRadius.circular(70),
    onTap: GoRouter.of(context).pop,
    child: const Icon(
      Iconsax.arrow_left_24,
      size: 30,
      color: Colors.white,
    ),
          );
  }
}
