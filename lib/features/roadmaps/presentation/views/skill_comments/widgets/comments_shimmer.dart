import 'package:flutter/material.dart';
import 'package:route_it27/core/utils/helpers/helper_functions.dart';
import 'package:shimmer/shimmer.dart';

class CommentsShimmer extends StatelessWidget {
  const CommentsShimmer({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[400]!,
        highlightColor: Colors.grey[100]!,
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey[800],
              radius: 24.0,
            ),
            SizedBox(width: HelperFunctions.screenWidth(context) * 0.02),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: HelperFunctions.screenWidth(context) * 0.4,
                    height: 16.0,
                    color: Colors.grey[800],
                  ),
                  const SizedBox(height: 8.0),
                  Container(
                    width: HelperFunctions.screenWidth(context) * 0.6,
                    height: 14.0,
                    color: Colors.grey[800],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
