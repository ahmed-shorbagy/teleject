import 'package:auth_api/app/data/providers/base_api_service.dart';
import 'package:auth_api/app/modules/auth/controllers/auth_controller.dart';
import 'package:auth_api/app/modules/auth/controllers/user_service.dart';
import 'package:auth_api/app/modules/auth/views/widgets/custom_text_feild.dart';
import 'package:auth_api/app/modules/auth/views/widgets/custome_button.dart';
import 'package:auth_api/app/modules/auth/views/widgets/login_options.dart';
import 'package:auth_api/core/utils/app_styles.dart';
import 'package:auth_api/core/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

final AuthController authController = Get.put(AuthController());
final GlobalKey<FormState> formKey = GlobalKey<FormState>();
AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
bool isobsecure = true;

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class _LoginFormState extends State<LoginForm> {
  @override
  void initState() {
    super.initState();
    ever(authController.errorMessage, (message) {
      if (authController.errorMessage.isNotEmpty) {
        Get.snackbar(
          "Error",
          message,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Get.put(BaseApiService());
    Get.put(UserService());

    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode, // Enable auto validation
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Email",
            style: AppStyles.regular12,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: CustomTextField(
              controller: emailController,
              fillColor: Colors.white,
              hintText: "Enter your email",
              validator: Validator.emailValidator, // Use Validator class
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Password",
            style: AppStyles.regular12,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: CustomTextField(
              controller: passwordController,
              fillColor: Colors.white,
              hintText: "***********",
              suffixicon: IconButton(
                onPressed: () {
                  setState(() {
                    isobsecure = !isobsecure;
                  });
                },
                icon: isobsecure
                    ? const Icon(Icons.visibility_off)
                    : const Icon(Icons.visibility),
              ),
              isobsecure: isobsecure,
              validator: Validator.passwordValidator, // Use Validator class
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const LoginOptions(),
          Obx(() {
            if (authController.isLoading.value) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return CustomButton(
                padding: const EdgeInsets.symmetric(vertical: 16),
                sideColor: Colors.transparent,
                gradientColor: const LinearGradient(
                  colors: [
                    Color(0xff465C65),
                    Color(0xff4B859F),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
                text: "Sign in",
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();

                    await authController.loginWithEmailAndPassword(
                      email: emailController.text,
                      password: passwordController.text,
                    );
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
                borderRadius: BorderRadius.circular(8),
              );
            }
          }),
        ],
      ),
    );
  }
}
