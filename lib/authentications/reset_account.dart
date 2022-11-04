import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class ResetAccount {
  TextEditingController email;
  ResetAccount({
    required this.email,
  });
  Future<String> resetAccount() async {
    try {
      // ignore: unused_local_variable
      var userCredential = await FirebaseAuth.instance.sendPasswordResetEmail(
        email: email.text,
      );
      return 'done';
    } on FirebaseAuthException catch (e) {
      return e.message.toString();
    }
  }
}
