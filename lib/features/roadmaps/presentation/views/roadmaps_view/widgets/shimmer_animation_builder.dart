import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:route_it27/core/utils/constants/constants_numbers.dart';
import 'package:route_it27/core/utils/helpers/helper_functions.dart';
import 'package:route_it27/features/roadmaps/presentation/views/roadmaps_view/widgets/roadmap_card_shimmer.dart';

class ShimmerAnimationBuilder extends StatelessWidget {
  const ShimmerAnimationBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
        padding: EdgeInsets.all(
            HelperFunctions.screenWidth(context) * horizintalMargin),
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            delay: const Duration(milliseconds: 100),
            child: const SlideAnimation(
              duration: Duration(milliseconds: 2500),
              curve: Curves.fastLinearToSlowEaseIn,
              child: FadeInAnimation(
                curve: Curves.fastLinearToSlowEaseIn,
                duration: Duration(milliseconds: 2500),
                child: RoadMapCardShimmer(),
              ),
            ),
          );
        },
      ),
    );
  }
}
