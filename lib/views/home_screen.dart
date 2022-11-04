import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:grocy/controller/cart_items_controller.dart';
import 'package:grocy/views/item_list.dart';

import 'package:grocy/views/grid_view_api.dart';
import 'package:grocy/views/widget_custome/bottomsheet_customized.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final product = Get.put(CartItemsController());
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const Text(
                      'Welcome',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      FirebaseAuth.instance.currentUser!.displayName!,
                      style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                GetX<CartItemsController>(
                    builder: (cart) => GestureDetector(
                          onTap: () {
                            Get.to(() => const ItemListScreen());
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: const Color(0xFF009B37),
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.shopping_bag,
                                  color: Colors.white,
                                ),
                                Text(cart.cartLenght.toString(),
                                    style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ))
                              ],
                            ),
                          ),
                        ))
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            margin: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                const Expanded(
                  flex: 2,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search Item',
                      prefixIcon: Icon(Icons.search),
                      contentPadding: EdgeInsets.all(10),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFE9FBEF),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFE9FBEF),
                        ),
                      ),
                      filled: true,
                      fillColor: Color(0xFFE9FBEF),
                      enabled: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const GridViewApi()
        ],
      )),
    );
  }
}
