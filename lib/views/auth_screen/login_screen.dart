// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:grocy/authentications/firebase_authentication.dart';
import 'package:grocy/controller/progress_controller.dart';
import 'package:grocy/views/auth_screen/forgetpassword_screen.dart';
import 'package:grocy/views/auth_screen/registration_screen.dart';
import 'package:grocy/views/home_screen.dart';

import 'package:grocy/views/widget_custome/edited_button.dart';
import 'package:grocy/views/widget_custome/underline_input.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    GlobalKey<FormState> keylogin = GlobalKey<FormState>();
    var loading = Get.find<ProgressController>();

    return Scaffold(
      body: Form(
        key: keylogin,
        child: Obx(
          () => Column(
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
              FlatButtonEdited(
                  title: 'Login',
                  function: () async {
                    if (keylogin.currentState!.validate()) {
                      loading.setProgress(progress: true);

                      FirebaseAuthentication firebaseAuthentication =
                          FirebaseAuthentication(
                        email: email,
                        password: password,
                      );
                      String result =
                          await firebaseAuthentication.loginAccount();

                      if (result == 'successful') {
                        Get.off(() => const HomeScreen());
                        loading.setProgress(progress: false);
                        Get.snackbar(
                          'Successful',
                          'Welcome back',
                          snackPosition: SnackPosition.BOTTOM,
                          margin: const EdgeInsets.only(
                            bottom: 10,
                            right: 10,
                            left: 10,
                          ),
                        );
                      } else {
                        loading.setProgress(
                          progress: false,
                        );
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
                    }
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  TextButton(
                    onPressed: () {
                      Get.to(() => const RegistrationScreen());
                    },
                    child: Text(
                      'Sign up',
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF009B37),
                      ),
                    ),
                  )
                ],
              ),
              loading.isLoading == false
                  ? Container()
                  : const CircularProgressIndicator(
                      color: Color(0xFF009B37),
                    )
            ],
          ),
        ),
      ),
      bottomSheet: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              Get.to(() => const ForgetpasswordScreen());
            },
            child: Text(
              'Forget Password ?',
              style: GoogleFonts.poppins(color: const Color(0xFF009B37)),
            ),
          ),
        ],
      ),
    );
  }
}
