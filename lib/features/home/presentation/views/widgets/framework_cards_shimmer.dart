import 'package:flutter/material.dart';
import 'package:route_it27/core/utils/constants/constants_numbers.dart';
import 'package:shimmer/shimmer.dart';
// import 'package:shimmer/shimmer.dart';

class FrameWorkCardsShimmer extends StatelessWidget {
  const FrameWorkCardsShimmer({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[400]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: size.width * 0.36,
            height: size.height * 0.041,
            color: Colors.white,
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 3,
            //padding: EdgeInsets.only(bottom: 100),
            itemBuilder: (context, index) {
              return Container(
                width: size.width * 0.90,
                height: size.height * 0.32,
                margin: EdgeInsets.only(
                    bottom: size.width * horizintalMargin),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    border: Border.all(
                        color: const Color(0xFFFFFFFF)
                            .withOpacity(0.5),
                        width: 0.3)),
              );
            },
          )
        ],
      ),
    );
  }
}
