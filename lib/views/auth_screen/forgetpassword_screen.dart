import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocy/authentications/reset_account.dart';
import 'package:grocy/controller/progress_controller.dart';
import 'package:grocy/views/widget_custome/edited_button.dart';

import '../widget_custome/underline_input.dart';

class ForgetpasswordScreen extends StatelessWidget {
  const ForgetpasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    GlobalKey<FormState> keyReset = GlobalKey<FormState>();
    final progress = Get.put(ProgressController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Form(
        key: keyReset,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Shop',
              style: GoogleFonts.poppins(
                fontSize: 40,
                color: const Color(0xFF009B37),
              ),
            ),
            UnderLineInput(
              keyboard: TextInputType.emailAddress,
              obsecure: false,
              hintText: 'Your account email',
              textEditingController: email,
              prefixIcon: const Icon(
                Icons.email,
                color: Color(0xFF009B37),
              ),
            ),
            FlatButtonEdited(
              title: 'Send Link',
              function: () async {
                if (keyReset.currentState!.validate()) {
                  progress.setProgress(progress: true);
                  String resetAccount =
                      await ResetAccount(email: email).resetAccount();
                  if (resetAccount == 'done') {
                    progress.setProgress(progress: false);
                    Get.snackbar(
                      'Successful',
                      'Reset link sent. Check your email',
                      snackPosition: SnackPosition.BOTTOM,
                      margin: const EdgeInsets.only(
                        bottom: 10,
                        right: 10,
                        left: 10,
                      ),
                    );
                  } else {
                    progress.setProgress(progress: false);
                    Get.snackbar(
                      'An error occured',
                      resetAccount,
                      snackPosition: SnackPosition.BOTTOM,
                      margin: const EdgeInsets.only(
                        bottom: 10,
                        right: 10,
                        left: 10,
                      ),
                    );
                  }
                }
              },
            ),
            GetX<ProgressController>(
                // ignore: unrelated_type_equality_checks
                builder: (clicked) => clicked.isLoading == false
                    ? Container()
                    : const CircularProgressIndicator(
                        color: Color(0xFF009B37),
                      ))
          ],
        ),
      ),
    );
  }
}
