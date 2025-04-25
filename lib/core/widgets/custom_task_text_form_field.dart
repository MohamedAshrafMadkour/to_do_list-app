import 'package:flutter/material.dart';
import 'package:to_do_list_app/core/utils/styles.dart';

class CustomTaskTextFormField extends StatelessWidget {
  const CustomTaskTextFormField({
    super.key,
    this.hintText,
    this.onChanged,
    this.autovalidateMode,
  });
  final String? hintText;
  final Function(String)? onChanged;
  final AutovalidateMode? autovalidateMode;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 28),
      child: TextFormField(
        autovalidateMode: autovalidateMode,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter a task';
          }
          return null;
        },
        onChanged: onChanged,
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
