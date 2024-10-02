// // ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:route_it27/core/utils/constants/app_colors.dart';

void showToast(String txt, ToastState toastState) => Fluttertoast.showToast(
    msg: txt,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 100,
    backgroundColor: chooseToastColor(toastState),
    textColor: Colors.white,
    fontSize: 16.0);

enum ToastState { SUCCESS, ERROR, WARNING }

Color chooseToastColor(ToastState state) {
  Color color;
  switch (state) {
    case ToastState.SUCCESS:
      color = Colors.green.withOpacity(.6);
      break;
    case ToastState.ERROR:
      color = AppColors.errorColor.withOpacity(.6);
      break;
    case ToastState.WARNING:
      color = AppColors.warningColor.withOpacity(.6);
      break;
  }
  return color;
}
