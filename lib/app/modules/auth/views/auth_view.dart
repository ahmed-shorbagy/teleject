import 'package:auth_api/app/modules/auth/views/widgets/custome_button.dart';
import 'package:auth_api/app/modules/auth/views/widgets/login_form.dart';
import 'package:auth_api/core/utils/app_colors.dart';
import 'package:auth_api/core/utils/app_styles.dart';
import 'package:auth_api/core/utils/assets.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Assets.imagesBg),
              alignment: Alignment.topCenter),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Login"
                "\n"
                "to your account",
                style: AppStyles.semiBold32,
              ),
              const SizedBox(
                height: 45,
              ),
              const LoginForm(),
              CustomButton(
                onPressed: () async {
                  await authController.signInWithGoogle();
                },
                borderRadius: BorderRadius.circular(8),
                sideColor: Colors.transparent,
                gradientColor: const LinearGradient(
                  colors: [
                    Color(0xff465C65),
                    Color(0xff4B859F),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    Assets.imagesGooglelogo,
                    scale: 60,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
