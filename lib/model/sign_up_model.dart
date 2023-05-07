import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:note_app/model/sign_in_model.dart';

void checkPasswordMatch(BuildContext context, passwordController, confirmPasswordController, emailController) {
  if(passwordController.text == confirmPasswordController.text){
    signUserUp(context, emailController, passwordController);
  }else{
    errorMessage(context, 'Password don\'t match');
  }
}

void signUserUp(BuildContext context, emailController, passwordController) async {
  //show loading circle
  showDialog(
    context: context,
    builder: (context) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    },
  );

  //try to sign up
  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text, password: passwordController.text);
    //pop the CircularProgressIndicator()
    Navigator.pop(context);
  } on FirebaseAuthException catch (e) {
    //pop the CircularProgressIndicator()
    Navigator.pop(context);
    errorMessage(context, e.code);
  }
}

