import 'package:flutter/material.dart';
import 'package:to_do_list_app/core/utils/styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.hintText,
    this.onChanged,
    this.obscureText,
  });
  final String? hintText;
  final Function(String)? onChanged;
  final bool? obscureText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 28),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'Empty Field';
          }
          return null;
        },
        onChanged: onChanged,
        obscureText: obscureText ?? false,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: 20, bottom: 20, left: 16),
          fillColor: Colors.white,
          filled: true,
          focusedBorder: outlineInputBorder(),
          hintText: hintText,
          hintStyle: Styles.textMedium13.copyWith(color: Colors.black),
          enabledBorder: outlineInputBorder(),
          border: outlineInputBorder(),
        ),
      ),
    );
  }

  OutlineInputBorder outlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(color: Colors.white, width: 2),
    );
  }
}
