import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocy/views/auth_screen/login_screen.dart';
import 'package:grocy/views/page_model.dart';
import 'package:grocy/views/widget_custome/edited_button.dart';
import 'package:onboarding/onboarding.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int index = 0;
    final introductions = [
      onBoardingPageModel(
        image: 'images/deliveryman.png',
        title: "Shop Your Daily Needs In Your Ease",
        body:
            'Set your delivery location.Choose your groceries from a wide range of our required products',
      ),
      onBoardingPageModel(
        image: 'images/deliverycar.png',
        title: "Real Time Reporting",
        body: 'Keep Track of sales with real-time notifications',
      ),
      onBoardingPageModel(
        image: 'images/deliveryservices.png',
        title: "Fast Door Step Delivery",
        body: 'Our delivery executives will deliver your product under 24hours',
      )
    ];
    return Scaffold(
      body: SafeArea(
        child: Onboarding(
          onPageChange: (currentIndex) {
            index = currentIndex;
          },
          startPageIndex: 0,
          pages: introductions,
          footerBuilder: ((context, netDragDistance, pagesLength, setIndex) {
            return Column(
              children: [
                CustomIndicator(
                    netDragPercent: netDragDistance,
                    indicator: Indicator(
                      activeIndicator: const ActiveIndicator(
                          borderWidth: 5, color: Colors.black),
                      closedIndicator: const ClosedIndicator(
                          color: Color(0xFF009B37), borderWidth: 5),
                      indicatorDesign: IndicatorDesign.line(
                        lineDesign: LineDesign(
                          lineType: DesignType.line_uniform,
                        ),
                      ),
                    ),
                    pagesLength: pagesLength),
                FlatButtonEdited(
                    title: 'Next',
                    function: () {
                      Get.off(
                        () => const LoginScreen(),
                      );
                    })
              ],
            );
          }),
        ),
      ),
    );
  }
}
