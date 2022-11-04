import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onboarding/onboarding.dart';

PageModel onBoardingPageModel({
  required String image,
  required String title,
  required String body,
}) {
  return PageModel(
      widget: Column(
    children: [
      Expanded(
        flex: 1,
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xFFEBFFF3),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(10.0),
            ),
          ),
          child: Center(
            child: Image(
              image: AssetImage(
                image,
              ),
            ),
          ),
        ),
      ),
      Expanded(
        flex: 1,
        child: Container(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  wordSpacing: 5.0,
                ),
              ),
              Text(
                body,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(fontSize: 15.0, wordSpacing: 8.0),
              )
            ],
          ),
        ),
      )
    ],
  ));
}
