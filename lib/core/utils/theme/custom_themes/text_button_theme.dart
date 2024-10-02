import 'package:flutter/material.dart';

class AppTextButtonTheme {
  AppTextButtonTheme._();
  static const lightTextButtonTheme = TextButtonThemeData(
    style: ButtonStyle(
      textStyle: MaterialStatePropertyAll(TextStyle(color: Colors.black))
    )
  );

  static const darkTextButtonTheme = TextButtonThemeData(
        style: ButtonStyle(
      textStyle: MaterialStatePropertyAll(TextStyle(color: Colors.white))
    )
  );
}
