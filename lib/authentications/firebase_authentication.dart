import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class FirebaseAuthentication {
  TextEditingController email;
  TextEditingController password;
  TextEditingController? username;
  FirebaseAuthentication({
    required this.email,
    required this.password,
    this.username,
  });

  Future<String> registerAccount() async {
    UserCredential firebaseAuth;
    User? user;

    try {
      firebaseAuth = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      user = firebaseAuth.user;
      await user!.updateDisplayName(username!.text);
      user.reload();
      user = firebaseAuth.user;
      return 'Account created';
    } on FirebaseAuthException catch (e) {
      return e.message.toString();
    }
  }

  Future<String> loginAccount() async {
    try {
      // ignore: unused_local_variable
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: email.text, password: password.text);
      return 'successful';
    } on FirebaseAuthException catch (e) {
      return e.message.toString();
    }
  }
}
