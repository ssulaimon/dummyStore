import 'package:get/get.dart';
import 'package:grocy/controller/bottomsheet_controller.dart';

import 'package:grocy/controller/location_controller.dart';
import 'package:grocy/controller/progress_controller.dart';
import 'package:grocy/controller/splash_screen_controller.dart';

class DependenciesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => SplashScreenController(),
    );
    Get.lazyPut(() => LocationController());
    Get.lazyPut(() => ProgressController());
    Get.lazyPut(() => BottomsheetController());
  }
}
