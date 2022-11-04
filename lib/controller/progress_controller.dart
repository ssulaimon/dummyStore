import 'package:get/get.dart';

class ProgressController extends GetxController {
  final isLoading = false.obs;

  void setProgress({required bool progress}) {
    isLoading(progress);
  }
}
