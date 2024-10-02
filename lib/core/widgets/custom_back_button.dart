import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:route_it27/core/utils/router/app_router.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton(
      {super.key, required this.width, required this.height});

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          GoRouter.of(context).pushReplacement(AppRouter.kRegisterView);
        },
        child: SizedBox(
          width: width,
          height: height,
          child: const Center(
              child: Icon(
            size: 25,
            Iconsax.arrow_left_24,
          )),
        ));
  }
}
