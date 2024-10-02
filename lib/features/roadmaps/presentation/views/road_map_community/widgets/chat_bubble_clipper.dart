import 'package:flutter/material.dart';

enum BubbleType { sendBubble, receiverBubble }

class ChatBubbleClipper1 extends CustomClipper<Path> {
  final BubbleType type;

  ChatBubbleClipper1({required this.type});

  @override
  Path getClip(Size size) {
    final path = Path();
    const radius = 16.0;

    path.addRRect(RRect.fromRectAndRadius(
      Rect.fromLTRB(0, 0, size.width, size.height),
      const Radius.circular(radius),
    ));

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
