import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void signUserIn(BuildContext context, dynamic emailController, dynamic passwordController) async {
  //show loading circle
  showDialog(
    context: context,
    builder: (context) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    },
  );

  //try to sign in
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text, password: passwordController.text);
    //pop the CircularProgressIndicator()
    Navigator.pop(context);
  } on FirebaseAuthException catch (e) {
    //pop the CircularProgressIndicator()
    Navigator.pop(context);
    // if (e.code == 'user-not-found') {
    //   errorMessage('Email');
    // } else if (e.code == 'wrong-password') {
    //   errorMessage('password');
    // }
    errorMessage(context, e.code);
  }
}

//error message
Future errorMessage(BuildContext context, String text) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Incorrect $text'),
      );
    },
  );
}