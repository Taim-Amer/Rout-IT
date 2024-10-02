

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HomeShimmer extends StatelessWidget {
  const HomeShimmer({
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
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 4,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: size.width * 0.035,
              mainAxisSpacing: size.width * 0.035,
            ),
            itemBuilder: (context, index) {
              return Container(
                decoration: const BoxDecoration(
                  borderRadius:
                       BorderRadius.all(Radius.circular(25)),
                  color: Colors.white,
                ),
              );
            },
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          Container(
            width: size.width * 0.25,
            height: size.height * 0.041,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}