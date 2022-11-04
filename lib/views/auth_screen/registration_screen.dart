import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocy/authentications/firebase_authentication.dart';
import 'package:grocy/controller/progress_controller.dart';

import '../widget_custome/edited_button.dart';
import '../widget_custome/underline_input.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController password = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController name = TextEditingController();
    TextEditingController rePassword = TextEditingController();
    GlobalKey<FormState> key = GlobalKey<FormState>();
    final progres = Get.put(ProgressController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: key,
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
                  keyboard: TextInputType.name,
                  obsecure: false,
                  hintText: 'Name',
                  textEditingController: name,
                  prefixIcon: const Icon(
                    Icons.person,
                    color: Color(0xFF009B37),
                  )),
              UnderLineInput(
                  keyboard: TextInputType.emailAddress,
                  obsecure: false,
                  hintText: 'Email',
                  textEditingController: email,
                  prefixIcon: const Icon(
                    Icons.email,
                    color: Color(0xFF009B37),
                  )),
              UnderLineInput(
                keyboard: TextInputType.visiblePassword,
                obsecure: true,
                hintText: 'Password',
                textEditingController: password,
                prefixIcon: const Icon(
                  Icons.lock,
                  color: Color(0xFF009B37),
                ),
              ),
              UnderLineInput(
                  keyboard: TextInputType.visiblePassword,
                  obsecure: true,
                  hintText: 'Re-Password',
                  textEditingController: rePassword,
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: Color(0xFF009B37),
                  )),
              FlatButtonEdited(
                title: 'Register',
                function: () async {
                  if (key.currentState!.validate()) {
                    if (password.text == rePassword.text) {
                      progres.setProgress(progress: true);
                      FirebaseAuthentication firebaseAuthentication =
                          FirebaseAuthentication(
                        email: email,
                        password: password,
                        username: name,
                      );
                      String result =
                          await firebaseAuthentication.registerAccount();
                      if (result == 'Account created') {
                        progres.setProgress(progress: false);
                        Get.snackbar(
                          'Successful',
                          'Your account has been created go ahead and login',
                          snackPosition: SnackPosition.BOTTOM,
                          margin: const EdgeInsets.only(
                            bottom: 10,
                            right: 10,
                            left: 10,
                          ),
                        );
                      } else {
                        progres.setProgress(progress: false);
                        Get.snackbar(
                          'An error occured',
                          result,
                          snackPosition: SnackPosition.BOTTOM,
                          margin: const EdgeInsets.only(
                            bottom: 10,
                            right: 10,
                            left: 10,
                          ),
                        );
                      }
                    } else {
                      Get.snackbar(
                        'Password',
                        'Password does not match',
                        snackPosition: SnackPosition.BOTTOM,
                        margin: const EdgeInsets.only(
                            bottom: 10, right: 10, left: 10),
                      );
                    }
                  }
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an accoun ?',
                    style: GoogleFonts.poppins(),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text(
                      'Log in',
                      style:
                          GoogleFonts.poppins(color: const Color(0xFF009B37)),
                    ),
                  )
                ],
              ),
              GetX<ProgressController>(
                  builder: (clicked) => clicked.isLoading == false
                      ? Container()
                      : const CircularProgressIndicator(
                          color: Color(0xFF009B37),
                        ))
            ],
          ),
        ),
      ),
    );
  }
}
