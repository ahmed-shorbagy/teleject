import 'package:flutter/material.dart';

import '../../../../../core/utils/app_styles.dart';

class CustomTextFeild extends StatelessWidget {
  const CustomTextFeild({
    super.key,
    required this.hintText,
    this.suffixicon,
    this.prefixicon,
    this.isobsecure,
    required this.fillColor,
    required this.onChanged,
  });
  final String hintText;
  final Widget? suffixicon, prefixicon;
  final bool? isobsecure;
  final Color fillColor;
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'This field is required';
              }
              return null;
            },
            onChanged: onChanged,
            obscureText: isobsecure ?? false,
            decoration: InputDecoration(
              suffixIcon: suffixicon,
              prefixIcon: prefixicon,
              hintText: hintText,
              hintStyle: AppStyles.regular14,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
              filled: true,
              fillColor: fillColor,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(6),
              ),
            ))
      ],
    );
  }
}
