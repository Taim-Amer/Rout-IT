import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LevelCardsShimmer extends StatelessWidget {
  const LevelCardsShimmer({
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
          SizedBox(
            height: size.height,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, index) {
                return Container(
                  width: size.width,
                  height: size.height * 0.13,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.circular(15)),
                  margin: EdgeInsets.only(
                      bottom: size.width * 0.05),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
