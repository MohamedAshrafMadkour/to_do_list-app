import 'package:flutter/material.dart';
import 'package:to_do_list_app/core/utils/styles.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.padding,
    this.color,
  });
  final String text;
  final void Function() onPressed;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 70),
        backgroundColor: color ?? const Color(0xff55847A),
        shape: const RoundedRectangleBorder(),
      ),
      onPressed: onPressed,
      child: Text(text, style: Styles.textMedium14),
    );
  }
}
