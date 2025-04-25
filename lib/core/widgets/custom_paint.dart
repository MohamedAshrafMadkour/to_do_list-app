import 'package:flutter/material.dart';

class CustomBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = const Color.fromRGBO(85, 132, 122, 0.55)
          ..style = PaintingStyle.fill;
    canvas.drawCircle(const Offset(0, 40), 100, paint);
    canvas.drawCircle(const Offset(80, 0), 100, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
