import 'package:auth_api/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final bool? isSelected;
  final VoidCallback onPressed;
  final BorderRadius borderRadius;
  final EdgeInsetsGeometry? padding;
  final Gradient? gradientColor;
  final Color sideColor;

  const CustomButton({
    super.key,
    required this.text,
    this.isSelected,
    required this.onPressed,
    required this.borderRadius,
    this.padding,
    this.gradientColor,
    required this.sideColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shadowColor: WidgetStateProperty.all(Colors.transparent),
        padding: WidgetStateProperty.all(padding ?? EdgeInsets.zero),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            side: BorderSide(color: sideColor),
            borderRadius: borderRadius,
          ),
        ),
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if (isSelected == null) {
            return Colors.transparent;
          }
          return isSelected! ? const Color(0xff476572) : Colors.white;
        }),
        overlayColor: WidgetStateProperty.all(Colors.transparent),
        foregroundColor: WidgetStateProperty.all(Colors.transparent),
        elevation: WidgetStateProperty.all(0),
        side: WidgetStateProperty.all(BorderSide(color: sideColor)),
      ),
      child: Ink(
        decoration: BoxDecoration(
          gradient: gradientColor,
          borderRadius: borderRadius,
        ),
        child: Container(
          padding: padding,
          alignment: Alignment.center,
          child: Text(
            text,
            style: AppStyles.regular14.copyWith(
              color: isSelected == null
                  ? Colors.white
                  : isSelected!
                      ? Colors.white
                      : const Color(0xff757575),
            ),
          ),
        ),
      ),
    );
  }
}
