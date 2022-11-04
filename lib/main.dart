import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocy/controller/dependencies_binding.dart/dependencies_binding.dart';
import 'package:grocy/views/splash_screen.dart';

void main() {
  runApp(GetMaterialApp(
    home: const SplashScreen(),
    initialBinding: DependenciesBinding(),
  ));
}
