import 'package:auth_api/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Assets.imagesBg), fit: BoxFit.cover),
          ),
          child: AnimatedBuilder(
            animation: controller.slidingAnimation,
            builder: (context, _) {
              return SlideTransition(
                position: controller.slidingAnimation,
                child: Center(
                  child: SvgPicture.asset(
                    Assets.imagesSplshIcon,
                  ),
                ),
              );
            },
          )),
    );
  }
}
