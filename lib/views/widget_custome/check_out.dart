import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocy/controller/cart_items_controller.dart';
import 'package:grocy/views/widget_custome/edited_button.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    final product = Get.put(CartItemsController());
    GlobalKey<FormState> form = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          'Checkout',
          style: GoogleFonts.poppins(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Form(
        key: form,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Card Number'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value) {
                    if (value!.length < 15 || value.length > 15) {
                      return 'Invalid card Number';
                    } else if (value.isEmpty) {
                      return 'Card number cannot be empty';
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF009B37))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF009B37))),
                      enabled: true,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF009B37)))),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Card Holder Name'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value) {
                    if (value!.length < 5) {
                      return 'Invalid card Name';
                    } else if (value.isEmpty) {
                      return 'Card name cannot be empty';
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF009B37))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF009B37))),
                      enabled: true,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF009B37)))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [Text('Expire date'), Text('CVV')],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.length < 2 || value.length > 2) {
                            return 'Invalid card MM';
                          } else if (value.isEmpty) {
                            return 'Card MM cannot be empty';
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            hintText: 'MM',
                            contentPadding: EdgeInsets.all(10),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF009B37))),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF009B37))),
                            enabled: true,
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF009B37)))),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.length < 2 || value.length > 2) {
                            return 'Invalid card YY';
                          } else if (value.isEmpty) {
                            return 'Card YY cannot be empty';
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            hintText: 'YY',
                            contentPadding: EdgeInsets.all(10),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF009B37))),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF009B37))),
                            enabled: true,
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF009B37)))),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.length < 3 || value.length > 3) {
                            return 'Invalid card CVV';
                          } else if (value.isEmpty) {
                            return 'Card CVV cannot be empty';
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            hintText: 'CVV',
                            contentPadding: EdgeInsets.all(10),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF009B37))),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF009B37))),
                            enabled: true,
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF009B37)))),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value) {
                    if (value!.length < 10) {
                      return 'Invalid address';
                    } else if (value.isEmpty) {
                      return 'Delivery address cannot be empty';
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.streetAddress,
                  maxLines: 3,
                  decoration: const InputDecoration(
                      hintText: 'Full delevery Address',
                      contentPadding: EdgeInsets.all(10),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF009B37))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF009B37))),
                      enabled: true,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF009B37)))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.length < 11 || value.length > 11) {
                      return 'Invalid Phone Number';
                    } else if (value.isEmpty) {
                      return 'Phone Number cannot be empty';
                    } else {
                      return null;
                    }
                  },
                  decoration: const InputDecoration(
                      hintText: 'Active Phone Number',
                      contentPadding: EdgeInsets.all(10),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF009B37))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF009B37))),
                      enabled: true,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF009B37)))),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Item Price:'),
                        GetX<CartItemsController>(
                            builder: (itemPrice) =>
                                Text('\$${itemPrice.total.toString()}.00'))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Delivery Price:'),
                        Text('\$5.00'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Vat Tax:'),
                        Text('\$2.00'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Total Amount:'),
                        GetX<CartItemsController>(
                            builder: (itemPrice) =>
                                Text('\$${itemPrice.total + 5 + 2}.00'))
                      ],
                    ),
                  ],
                ),
              ),
              FlatButtonEdited(
                title: 'Pay Now',
                function: () {
                  if (form.currentState!.validate()) {
                    Get.bottomSheet(
                      Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(10.0))),
                        width: 200,
                        height: 200,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text("Order Completed"),
                              Icon(
                                Icons.check,
                                color: Color(0xFF009B37),
                                size: 70,
                              ),
                            ]),
                      ),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
