import 'package:flutter/material.dart';
import 'package:route_it27/core/utils/constants/app_colors.dart';

class CustomTextFieldItem extends StatelessWidget {
  const CustomTextFieldItem({
    super.key,
    this.onTap,
    this.onSubmit,
    this.onChange,
    this.color1,
    this.color2,
    this.suffix,
    this.isPassword = false,
    this.suffixPressed,
    required this.validator,
    required this.hint,
    required this.prefix,
    required this.controller,
    required this.type,
  });

  final VoidCallback? onTap;
  final Function? onSubmit;
  final ValueChanged<String>? onChange;
  final bool isPassword;
  final Color? color1;
  final Color? color2;
  final Color color3 = AppColors.subTitleColor;
  final IconData? suffix;
  final Function? suffixPressed;
  final String? Function(String?) validator;
  final String hint;
  final IconData prefix;
  final TextEditingController controller;
  final TextInputType type;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.lightPrimaryColor.withOpacity(.6),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        onTap: onTap,
        controller: controller,
        onFieldSubmitted: onSubmit != null ? (s) => onSubmit!() : null,
        onChanged: onChange,
        validator: validator,
        keyboardType: type,
        obscureText: isPassword,
        cursorColor: AppColors.primaryColor,
        style: const TextStyle(
            color: AppColors.lightPrimaryColor, fontStyle: FontStyle.normal),
        decoration: InputDecoration(
          errorStyle: const TextStyle(
            color: AppColors.errorColor,
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: AppColors.errorColor.withOpacity(.4),
              style: BorderStyle.solid,
            )
          ),
          enabledBorder: InputBorder.none,
          hintText: hint,
          hintStyle: const TextStyle(
              letterSpacing: 1.5,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryColor,
              fontStyle: FontStyle.normal,
              fontSize: 15),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.warningColor.withOpacity(.4)
            ),
            borderRadius: BorderRadius.circular(10)
          ),
          focusedBorder: const OutlineInputBorder(
              borderSide:
                  BorderSide(color: AppColors.primaryColor, style: BorderStyle.none)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          prefixIcon: Icon(
            prefix,
            color: AppColors.primaryColor,
          ),
          suffixIcon: suffix != null
              ? IconButton(
                  onPressed: () {
                    suffixPressed!();
                  },
                  icon: Icon(
                    suffix,
                    color: AppColors.primaryColor,
                  ))
              : null,
        ),
      ),
    );
  }
}
