import 'package:flutter/material.dart';
import 'package:route_it27/core/utils/helpers/helper_functions.dart';
import 'package:shimmer/shimmer.dart';

class RoadMapDetailsShimmer extends StatelessWidget {
  const RoadMapDetailsShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Expanded(
              child: ShimmerInfoContainer(),
            ),
            SizedBox(width: HelperFunctions.screenWidth(context) * 0.02),
            const Expanded(
              child: ShimmerInfoContainer(),
            ),
          ],
        ),
        SizedBox(
          height: HelperFunctions.screenHeight(context) * 0.02,
        ),
        GlobalShimmer(
          child: Container(
            width: double.infinity,
            height: 20.0,
            color: Colors.white,
          ),
        ),
        SizedBox(
          height: HelperFunctions.screenHeight(context) * 0.02,
        ),
        GlobalShimmer(
          child: Container(
            width: double.infinity,
            height: 20.0,
            color: Colors.white,
          ),
        ),
        SizedBox(
          height: HelperFunctions.screenHeight(context) * 0.02,
        ),
        Column(
          children: List.generate(3, (index) => const ShimmerSkillTile()),
        ),
      ],
    );
  }
}

class GlobalShimmer extends StatelessWidget {
  final Widget child;

  const GlobalShimmer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[400]!,
      highlightColor: Colors.grey[100]!,
      child: child,
    );
  }
}

class ShimmerInfoContainer extends StatelessWidget {
  const ShimmerInfoContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalShimmer(
      child: Container(
        padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 12.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 12,
              backgroundColor: Colors.white,
            ),
            SizedBox(width: HelperFunctions.screenWidth(context) * 0.04),
            Container(
              width: 80.0,
              height: 12.0,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

class ShimmerSkillTile extends StatelessWidget {
  const ShimmerSkillTile({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalShimmer(
      child: Container(
        margin: EdgeInsets.symmetric(
            vertical: HelperFunctions.screenHeight(context) * 0.01),
        padding: EdgeInsets.all(HelperFunctions.screenWidth(context) * 0.04),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 12,
              backgroundColor: Colors.white,
            ),
            SizedBox(width: HelperFunctions.screenWidth(context) * 0.04),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 12.0,
                    color: Colors.white,
                  ),
                  SizedBox(
                      height: HelperFunctions.screenHeight(context) * 0.008),
                  Container(
                    width: double.infinity,
                    height: 12.0,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            const CircleAvatar(
              radius: 12,
              backgroundColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
