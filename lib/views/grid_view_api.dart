import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:grocy/api_call/dummy_api.dart';
import 'package:grocy/controller/cart_items_controller.dart';
import 'package:grocy/model/product_details.dart';

class GridViewApi extends StatelessWidget {
  const GridViewApi({super.key});

  @override
  Widget build(BuildContext context) {
    final addItem = Get.put(CartItemsController());
    return Expanded(
      flex: 2,
      child: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            List<ProductDetails> products =
                snapshot.data as List<ProductDetails>;
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 20.0,
                  crossAxisSpacing: 20.0,
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFFE9FBEF),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: GridTile(
                    header: Text(
                      products[index].title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    footer: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$${products[index].price.toString()}.00",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                            onPressed: () {
                              addItem.addItem(
                                productDetails: products[index],
                              );
                            },
                            icon: const Icon(
                              Icons.shopping_cart,
                              size: 30,
                              color: Color(0xFF009B37),
                            ))
                      ],
                    ),
                    child: Image.network(
                      products[index].thumbnail,
                    ),
                  ),
                );
              },
              itemCount: products.length,
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Color(0xFF009B37),
              ),
            );
          } else {
            return Text('Something went wrong');
          }
        },
        future: DummyApi().getDummyProducts(),
      ),
    );
  }
}
