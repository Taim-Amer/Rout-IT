import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:route_it27/core/utils/constants/app_colors.dart';

import 'custom_themes/appbar_theme.dart';
import 'custom_themes/bottom_theme_sheet.dart';
import 'custom_themes/checkbox_theme.dart';
import 'custom_themes/elevated_button_theme.dart';
import 'custom_themes/outlined_button_theme.dart';
import 'custom_themes/text_button_theme.dart';
import 'custom_themes/text_field_theme.dart';
import 'custom_themes/text_theme.dart';

class AppTheme {
  //private constructor to prevent calling the constructor over and over agian
  AppTheme._();
  static ThemeData lightTheme() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: AppColors.darkPrimaryColor.withOpacity(0.15),
        statusBarIconBrightness: Brightness.light));
    return ThemeData(
        useMaterial3: true,
        fontFamily: 'Ubuntu',
        brightness: Brightness.light,
        primaryColor: AppColors.primaryColor,
        scaffoldBackgroundColor: AppColors.lightPrimaryColor,
        textTheme: AppTextTheme.lightTextTheme,
        elevatedButtonTheme: AppElevatedButtonTheme.lightElevatedButtonTheme,
        appBarTheme: RAppBarTheme.lightAppBarTheme,
        bottomSheetTheme: RBottomSheetTheme.lightBottomSheetTheme,
        checkboxTheme: AppCheckBoxTheme.lightCheckBoxTheme,
        outlinedButtonTheme: AppOutLinedButtonTheme.lightOutLinedButtonTheme,
        inputDecorationTheme: AppTextFormFieldTheme.lightInputDecorationTheme,
        textButtonTheme: AppTextButtonTheme.lightTextButtonTheme);
  }

  static ThemeData darkTheme() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.white.withOpacity(0.15),
        statusBarIconBrightness: Brightness.dark));

    return ThemeData(
        useMaterial3: true,
        fontFamily: 'Ubuntu',
        brightness: Brightness.dark,
        primaryColor: AppColors.primaryColor,
        scaffoldBackgroundColor: AppColors.darkPrimaryColor,
        textTheme: AppTextTheme.darkTextTheme,
        elevatedButtonTheme: AppElevatedButtonTheme.darkElevatedButtonTheme,
        appBarTheme: RAppBarTheme.darkAppBarTheme,
        bottomSheetTheme: RBottomSheetTheme.darkBottomSheetTheme,
        checkboxTheme: AppCheckBoxTheme.darkCheckBoxTheme,
        outlinedButtonTheme: AppOutLinedButtonTheme.darkOutLinedButtonTheme,
        inputDecorationTheme: AppTextFormFieldTheme.darkInputDecorationTheme,
        textButtonTheme: AppTextButtonTheme.darkTextButtonTheme);
  }
}
