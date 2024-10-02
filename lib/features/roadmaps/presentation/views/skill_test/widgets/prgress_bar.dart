import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:route_it27/core/utils/constants/app_colors.dart';
import 'package:route_it27/core/utils/constants/constants_numbers.dart';
import 'package:route_it27/core/utils/helpers/helper_functions.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: HelperFunctions.screenHeight(context) * 0.04,
      decoration: BoxDecoration(
        border:
            Border.all(color: Color(0xff3f4768), width: 3),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Stack(
        children: [
          LayoutBuilder(
            builder: (context, constraints) => Container(
              width: constraints.maxWidth * 0.5,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      AppColors.primaryColor,
                      AppColors.secondaryColor2,
                    ]),
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
          Positioned.fill(child: Padding(
    
            padding:  EdgeInsets.symmetric(horizontal: HelperFunctions.screenWidth(context)*horizintalMargin/2),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("18 sec"),
              Icon(Iconsax.clock)
            
              ],
            ),
          ))
        ],
      ),
    );
  }
}