import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocy/controller/location_controller.dart';
import 'package:grocy/views/widget_custome/edited_button.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var location = Get.find<LocationController>();
    return Scaffold(
      body: Center(
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              location.address.value == null
                  ? Text(
                      'Trying To Get your Location',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(),
                    )
                  : const Text('Location Provided by Your GPS'),
              const SizedBox(
                height: 20,
              ),
              location.address.value == null
                  ? const CircularProgressIndicator(
                      color: Color(0xFF009B37),
                    )
                  : Text(
                      ' Country: ${location.address.value!.country}\n Street: ${location.address.value!.street} \n Postal code: ${location.address.value!.postalCode}\n Sub-Locality: ${location.address.value!.subLocality}',
                      style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                    ),
              const SizedBox(
                height: 20,
              ),
              FlatButtonEdited(title: "Continue", function: () {})
            ],
          ),
        ),
      ),
    );
  }
}
