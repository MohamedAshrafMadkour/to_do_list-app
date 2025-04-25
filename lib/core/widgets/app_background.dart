import 'package:flutter/material.dart';
import 'package:to_do_list_app/core/widgets/custom_paint.dart';

class AppBackground extends StatelessWidget {
  const AppBackground({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: CustomPaint(painter: CustomBackgroundPainter(), child: child),
    );
  }
}
