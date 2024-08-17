import 'package:auth_api/app/modules/auth/views/widgets/remeber_me_checkBox.dart';
import 'package:auth_api/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class LoginOptions extends StatelessWidget {
  const LoginOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            const RememberMeCheckBox(),
            Text(
              "Remember me",
              style: AppStyles.regular12,
            )
          ],
        ),
        const Spacer(),
        GestureDetector(
          child: Text(
            "Forgot Password?",
            style: AppStyles.regular12,
          ),
        )
      ],
    );
  }
}
