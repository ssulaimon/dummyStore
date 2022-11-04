import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocy/controller/cart_items_controller.dart';
import 'package:grocy/views/payment_method_option.dart';

class ItemListScreen extends StatelessWidget {
  const ItemListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productItem = Get.put(CartItemsController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          'Cart List',
          style: GoogleFonts.poppins(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      floatingActionButton: GetX<CartItemsController>(
        builder: (product) => FloatingActionButton.extended(
          onPressed: () {
            if (product.cartLenght == 0) {
              return;
            } else {
              Get.to(() => const PaymentMenthod());
            }
          },
          label: Text('Total: \$${product.total.toString()}.00'),
          icon: const Icon(Icons.shopping_cart_outlined),
          backgroundColor: const Color(0xFF009B37),
        ),
      ),
      body: GetX<CartItemsController>(builder: (product) {
        if (product.cartLenght == 0) {
          return const Center(child: Text('No Item added'));
        } else {
          return ListView.builder(
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 3.0,
                      color: const Color(0xFF009B37),
                      style: BorderStyle.solid,
                    ),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.network(
                      product.cartItems[index].thumbnail,
                      width: 100,
                      height: 100,
                    ),
                    Column(
                      children: [
                        Text(
                          product.cartItems[index].title,
                          style: GoogleFonts.poppins(
                            fontSize: 15.00,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                            '\$${product.cartItems[index].price.toString()}.00')
                      ],
                    ),
                    IconButton(
                        onPressed: () {
                          product.removeAt(remove: index);
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Color(0xFF009B37),
                          size: 30,
                        ))
                  ],
                ),
              );
            },
            itemCount: productItem.cartItems.length,
          );
        }
      }),
    );
  }
}
