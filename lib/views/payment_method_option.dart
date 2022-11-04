import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocy/views/widget_custome/check_out.dart';

class PaymentMenthod extends StatelessWidget {
  const PaymentMenthod({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: const Text(
          'Payment methods',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              Get.to(Checkout());
            },
            child: Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: const Color(
                      0xFF009B37,
                    ),
                  )),
              child: Text(
                'Credit card',
                style: GoogleFonts.poppins(fontSize: 20.00),
              ),
            ),
          ),
          GestureDetector(
            child: Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: const Color(
                      0xFF009B37,
                    ),
                  )),
              child: Text(
                'Debit card',
                style: GoogleFonts.poppins(fontSize: 20.00),
              ),
            ),
          ),
          GestureDetector(
            child: Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: const Color(
                      0xFF009B37,
                    ),
                  )),
              child: Text(
                'Cash on delivery',
                style: GoogleFonts.poppins(fontSize: 20.00),
              ),
            ),
          )
        ],
      ),
    );
  }
}
