
import 'package:flutter/material.dart';
import 'package:route_it27/core/utils/constants/constants_numbers.dart';
import 'package:route_it27/core/utils/helpers/helper_functions.dart';
import 'package:shimmer/shimmer.dart';

class RoadMapCardShimmer extends StatelessWidget {
  const RoadMapCardShimmer({
    super.key,
  
  });

  

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[400]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: List.generate(3, (index) {
              return Container(
                margin: EdgeInsets.only(
                    bottom: HelperFunctions.screenWidth(context) * horizintalMargin),
                width: HelperFunctions.screenWidth(context),
                height: HelperFunctions.screenHeight(context) * 0.25,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
              );
            }),
          ),
        ],
      ),
    );
  }
}
