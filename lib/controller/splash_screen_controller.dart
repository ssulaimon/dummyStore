import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocy/firebase_options.dart';
import 'package:grocy/views/home_screen.dart';
import 'package:grocy/views/onboarding_screen.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    pushToNextscreen();
  }

  Future<void> pushToNextscreen() async {
    bool isConnected = await InternetConnectionChecker().hasConnection;

    if (isConnected == false) {
      Get.snackbar('Internet', 'Please Connect to internet',
          duration: const Duration(
            minutes: 1,
          ),
          isDismissible: true);
    } else {
      await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform);
      await Future.delayed(const Duration(seconds: 4), () {
        if (FirebaseAuth.instance.currentUser == null) {
          Get.off(
            () => const OnBoardingScreen(),
          );
        } else {
          Get.off(
            () => const HomeScreen(),
          );
        }
      });
    }
  }
}
