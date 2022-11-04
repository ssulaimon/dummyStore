// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class FlatButtonEdited extends StatelessWidget {
  String title;
  Function() function;
  FlatButtonEdited({required this.title, required this.function, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 10.0,
        ),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          vertical: 15.0,
        ),
        color: const Color(0xFF009B37),
        child: Center(
          child: Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
