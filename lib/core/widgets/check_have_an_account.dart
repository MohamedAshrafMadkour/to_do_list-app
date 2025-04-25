import 'package:flutter/material.dart';
import 'package:to_do_list_app/core/utils/styles.dart';

class CheckHaveAnAccount extends StatelessWidget {
  const CheckHaveAnAccount({
    super.key,
    required this.check,
    required this.enter,
    this.onTap,
  });
  final String check, enter;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(check, style: Styles.textMedium15),
        InkWell(
          onTap: onTap,
          child: Text(
            enter,
            style: Styles.textMedium15.copyWith(color: const Color(0xff55847A)),
          ),
        ),
      ],
    );
  }
}
