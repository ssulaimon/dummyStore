import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:grocy/controller/splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var splashScreenController = Get.find<SplashScreenController>();
    return const Scaffold(
      body: SafeArea(
        child: Center(child: Image(image: AssetImage('images/background.png'))),
      ),
    );
  }
}
