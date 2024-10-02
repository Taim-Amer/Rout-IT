// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:route_it27/core/utils/constants/app_colors.dart';

class MyTextStyles {
  static const double titleSize = 22.0;
  static const double subTitleSize = 16.0;
  static const FontWeight titleWeight = FontWeight.w500;
  static const FontWeight textWeight = FontWeight.w400;

  static const titleStyle = TextStyle(
      fontSize: MyTextStyles.titleSize, fontWeight: MyTextStyles.titleWeight);
}

class TitleText extends StatelessWidget {
  TitleText({
    super.key,
    required this.text,
    this.color = AppColors.textOnPrimaryColor
  });

  final String text;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: color),
    );
  }
}

class SubTitleText extends StatelessWidget {
  SubTitleText({
    super.key,
    required this.text,
    this.color = AppColors.textOnPrimaryColor
  });

  final String text;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: color),
    );
  }
}

class DetailsText extends StatelessWidget {
  DetailsText({
    super.key,
    required this.text,
    this.color = AppColors.textOnPrimaryColor
  });

  final String text;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: color),
    );
  }
}
