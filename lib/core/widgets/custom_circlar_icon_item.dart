// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:route_it27/core/utils/constants/app_colors.dart';

class CustomCirclarIconItem extends StatelessWidget {
  CustomCirclarIconItem({super.key, required this.function , this.icon});

  final Function() function;
  Icon? icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      highlightColor: AppColors.lightPrimaryColor,
      onTap: function,
      child: CircleAvatar(
        radius: 20,
        backgroundColor: AppColors.lightPrimaryColor,
        child: icon,
      ),
    );
  }
}
