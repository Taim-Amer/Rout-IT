import 'package:flutter/material.dart';
import 'package:route_it27/core/utils/constants/app_colors.dart';
import 'package:route_it27/core/utils/helpers/helper_functions.dart';

//-- dark & light theme for elevated button
class AppElevatedButtonTheme {
  AppElevatedButtonTheme._();

  //-- light theme

  static final ElevatedButtonThemeData lightElevatedButtonTheme =
      ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              elevation: 0,
              foregroundColor: Colors.white,
              backgroundColor: AppColors.lightPrimaryColor,
              disabledBackgroundColor: Colors.grey,
              disabledForegroundColor: Colors.grey,
              
              padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 10),
              textStyle: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))));

  //-- dark theme
  static final ElevatedButtonThemeData darkElevatedButtonTheme =
      ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              elevation: 0,
              foregroundColor: Colors.white,
              backgroundColor: AppColors.darkPrimaryColor,
              disabledBackgroundColor: Colors.grey,
              disabledForegroundColor: Colors.grey,
             
              padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 10),
              textStyle: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))));
}
