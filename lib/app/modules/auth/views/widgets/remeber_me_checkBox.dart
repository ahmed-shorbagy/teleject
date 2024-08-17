import 'package:flutter/material.dart';

class RememberMeCheckBox extends StatefulWidget {
  const RememberMeCheckBox({
    super.key,
  });

  @override
  State<RememberMeCheckBox> createState() => _RememberMeCheckBoxState();
}

bool isChecked = false;

class _RememberMeCheckBoxState extends State<RememberMeCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1.5, // Adjust this value to achieve the desired size
      child: Checkbox(
        value: isChecked,
        onChanged: (value) {
          setState(() {
            isChecked = value!;
          });
        },
        fillColor: const WidgetStatePropertyAll(Colors.white),
        checkColor: Colors.black,
        side: const BorderSide(
          color: Colors.transparent,
        ),
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }
}
