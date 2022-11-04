import 'package:get/get.dart';

class BottomsheetController extends GetxController {
  final currentIndex = 20.00.obs;
  final multiselectItem = <String>[
    'Bags',
    'Shoes',
    'Groceries',
    'Clothes',
    'Bueaty',
    'Jewelry',
  ].obs;
  var selectedItem = <String>[].obs;

  void changeIndex({required double setIndex}) {
    currentIndex(setIndex);
  }

  addedCategory({
    required List<String> category,
  }) {
    selectedItem(category);
  }
}
