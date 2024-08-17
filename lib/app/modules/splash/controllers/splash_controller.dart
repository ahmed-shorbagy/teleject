import 'package:auth_api/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final Duration duration = const Duration(seconds: 4);
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void onInit() {
    super.onInit();

    animationController = AnimationController(
      vsync: this,
      duration: duration,
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Get.offAllNamed(Routes.AUTH);
        }
      });
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 6), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
  }

  @override
  void onClose() {
    super.onClose();
    animationController.dispose();
  }
}
