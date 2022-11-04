import 'package:get/get.dart';
import 'package:grocy/model/product_details.dart';

class CartItemsController extends GetxController {
  final cartItems = <ProductDetails>[].obs;

  void addItem({required ProductDetails productDetails}) {
    cartItems.add(productDetails);
  }

  int get cartLenght => cartItems.length;
  int get total => cartItems.fold(0, (sum, item) => sum + item.price);
  void removeAt({required int remove}) {
    cartItems.removeAt(remove);
  }
}
