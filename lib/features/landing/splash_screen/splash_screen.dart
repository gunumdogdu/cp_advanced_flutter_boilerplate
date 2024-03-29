import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_project/features/landing/splash_screen/controller/splash_controller.dart';
import 'package:flutter_base_project/features/landing/splash_screen/view/splash.dart';
import 'package:get/get.dart';

/// Splash ekranı
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (SplashController controller) {
        return Splash(
          controller: controller,
        );
      },
    );
  }
}
