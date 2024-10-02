
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class GradientBackgroundPainter extends CustomPainter {
  final List<Color> colors;
  final double borderRadius;

  GradientBackgroundPainter({
    required this.colors,
    this.borderRadius = 15.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    var path = Path();

    // Clipping the canvas to match the border radius
    var clipPath = Path()
      ..addRRect(RRect.fromRectAndRadius(
          Rect.fromLTWH(0, 0, size.width, size.height),
          Radius.circular(borderRadius)));
    canvas.clipPath(clipPath);

    // Create gradient background
    var gradient = ui.Gradient.linear(
      const Offset(0, 0),
      Offset(size.width, size.height),
      colors,
      List<double>.generate(
          colors.length, (index) => index / (colors.length - 1)),
    );

    paint.shader = gradient;
    path.addRect(Rect.fromLTRB(0, 0, size.width, size.height));
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
