import 'package:flutter/material.dart';
import 'package:route_it27/core/utils/constants/app_colors.dart';

class CustomOutlinedTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Color outlineColor;
  final double outlineWidth;

  const CustomOutlinedTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.outlineColor = AppColors.darkPrimaryColor,
    this.outlineWidth = 3.0,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(
        color: Colors.white
      ),
      cursorColor: AppColors.secondaryColor,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 40, horizontal: 12.0),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: AppColors.lightPrimaryColor,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: outlineColor,
            width: outlineWidth,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.secondaryColor,
            width: outlineWidth,
          ),
        ),
      ),
    );
  }
}
