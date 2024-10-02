import 'package:flutter/material.dart';

class CustomShaderMasK extends StatelessWidget {
  const CustomShaderMasK(
      {super.key,
      required this.fadeInColor,
      required this.imageUrl,
      required this.height,
      required this.width});
  final String imageUrl;

  final double width;
  final double height;
  final Color fadeInColor;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcATop,
      shaderCallback: (Rect bounds) {
        return LinearGradient(
          begin: Alignment.center,
          end: Alignment.bottomCenter,
          colors: [Colors.transparent, fadeInColor],
        ).createShader(bounds);
      },
      child: Image.asset(
        imageUrl,
        fit: BoxFit.cover,
        width: width,
        height: height,
      ),
    );
  }
}
