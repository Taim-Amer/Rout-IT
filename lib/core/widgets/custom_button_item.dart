// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:route_it27/core/utils/constants/app_colors.dart';

class CustomButtonItem extends StatelessWidget {
  const CustomButtonItem(
      {super.key,
      this.backgroundColor = AppColors.darkPrimaryColor,
      required this.function,
      required this.text,
      required this.width,
      required this.height,
      required this.radius,
      required this.textColor});

  final double width;
  final double height;

  final Color? backgroundColor;
  final bool isUpperCase = true;
  final double radius;
  final Function function;
  final String text;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: MaterialButton(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        highlightColor: AppColors.primaryColor,
        onPressed: () {
          function();
        },
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryColor.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}
