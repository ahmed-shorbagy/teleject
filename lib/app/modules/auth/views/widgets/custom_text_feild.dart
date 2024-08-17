import 'package:auth_api/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.suffixicon,
    this.prefixicon,
    this.isobsecure,
    required this.fillColor,
    required this.controller,
    required this.validator, // Add validator here
  });
  final String hintText;
  final Widget? suffixicon, prefixicon;
  final bool? isobsecure;
  final Color fillColor;
  final TextEditingController controller;
  final String? Function(String?) validator; // Validator function

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextFormField(
          controller: controller,
          validator: validator,
          obscureText: isobsecure ?? false,
          decoration: InputDecoration(
            suffixIcon: suffixicon,
            prefixIcon: prefixicon,
            hintText: hintText,
            hintStyle:
                AppStyles.regular14.copyWith(color: const Color(0xff636364)),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            filled: true,
            fillColor: fillColor,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
      ],
    );
  }
}
