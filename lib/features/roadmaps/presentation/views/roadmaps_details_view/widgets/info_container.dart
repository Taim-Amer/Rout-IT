import 'package:flutter/material.dart';
import 'package:route_it27/core/utils/constants/app_colors.dart';
import 'package:route_it27/core/utils/helpers/helper_functions.dart';

class InfoContainer extends StatelessWidget {
  final BuildContext context;
  final IconData icon;

  final String text;

  const InfoContainer(
      {super.key,
      required this.context,
      required this.icon,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 12.0),
        decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 12,
              backgroundColor: AppColors.whiteColor,
              child: Icon(
                icon,
                color: AppColors.secondaryColor,
                size: 18.0,
              ),
            ),
            SizedBox(width: HelperFunctions.screenWidth(context) * 0.04),
            Text(
              text,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ],
        ));
  }
}