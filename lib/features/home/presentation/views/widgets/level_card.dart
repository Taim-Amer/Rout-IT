
import 'package:flutter/material.dart';
import 'package:route_it27/core/utils/constants/app_colors.dart';
import 'package:route_it27/core/widgets/gradient_background_painter.dart';
import 'package:route_it27/features/home/data/models/level_model.dart';

class LevelCard extends StatelessWidget {
  const LevelCard({
    super.key,
    required this.size,
    required this.levels,
    required this.index,
  });

  final Size size;
  final List<LevelModel> levels;
  final int index;

  @override
  Widget build(BuildContext context) {
    // Create a dynamic selection of colors based on the index
    List<Color> gradientColors = [
      AppColors.cardColors[index % AppColors.cardColors.length],
      AppColors.cardColors[(index + 1) % AppColors.cardColors.length],
    ];

    return Container(
      width: size.width,
      height: size.height * 0.13,
      margin: EdgeInsets.only(bottom: size.width * 0.05),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: CustomPaint(
        painter: GradientBackgroundPainter(
          colors: gradientColors,
          borderRadius: 15,
        ),
        child: Center(
          child: Text(
            levels[index].level!.toUpperCase(),
            style: TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: [
                Shadow(
                  blurRadius: 10.0,
                  color: Colors.black.withOpacity(0.75),
                  offset: const Offset(2.0, 2.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
