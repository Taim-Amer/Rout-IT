import 'package:flutter/material.dart';
import 'package:route_it27/core/utils/constants/app_colors.dart';
import 'package:route_it27/core/utils/helpers/helper_functions.dart';
import 'package:route_it27/core/utils/styles/app_styles.dart';
import 'package:route_it27/core/utils/constants/assets_data.dart';

class CustomErrorItem extends StatelessWidget {
  const CustomErrorItem(
      {super.key, required this.errorMessage});

  final String errorMessage;
  

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
            AppColors.darkPrimaryColor,
            AppColors.primaryColor,
            AppColors.secondaryColor2,
          ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
        ),
        body: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                margin: EdgeInsets.only(bottom: HelperFunctions.screenWidth(context) * 0.1),
                width: HelperFunctions.screenWidth(context) * 0.5,
                height: HelperFunctions.screenWidth(context) * 0.5,
                child: Image.asset(
                  AssetsData.errorImg,
                  fit: BoxFit.cover,
                )),
            SubTitleText(text: errorMessage)
          ],
        )),
      ),
    );
  }
}
