import 'dart:ui';

import 'package:flutter/material.dart';

class RoundedBottomRectangleClipper extends CustomClipper<Path> {
  final double borderRadius;

  RoundedBottomRectangleClipper({required this.borderRadius});

  @override
  Path getClip(Size size) {
    var path = Path()
      ..moveTo(0, 0)
      ..lineTo(0, size.height - borderRadius)
      ..quadraticBezierTo(0, size.height, borderRadius, size.height)
      ..lineTo(size.width - borderRadius, size.height)
      ..quadraticBezierTo(
          size.width, size.height, size.width, size.height - borderRadius)
      ..lineTo(size.width, 0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}