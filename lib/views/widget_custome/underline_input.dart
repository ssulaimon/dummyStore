import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class UnderLineInput extends StatelessWidget {
  String hintText;
  TextEditingController textEditingController;
  Icon prefixIcon;
  bool obsecure;
  TextInputType keyboard;

  UnderLineInput({
    required this.keyboard,
    required this.hintText,
    required this.textEditingController,
    required this.prefixIcon,
    required this.obsecure,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 10,
      ),
      child: TextFormField(
        keyboardType: keyboard,
        obscureText: obsecure,
        decoration: InputDecoration(
          enabled: true,
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
            color: Color(0xFF009B37),
          )),
          border: const OutlineInputBorder(
              borderSide: BorderSide(
            color: Color(0xFF009B37),
          )),
          hintText: hintText,
          hintStyle: GoogleFonts.poppins(
              fontWeight: FontWeight.bold, color: Colors.black),
          contentPadding: const EdgeInsets.all(8),
          prefixIcon: prefixIcon,
        ),
        controller: textEditingController,
        validator: (value) {
          if (value == null) {
            return 'Cannot be empty';
          } else if (value.isEmpty) {
            return 'Cannot be empty';
          } else {
            return null;
          }
        },
      ),
    );
  }
}
