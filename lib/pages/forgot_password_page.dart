import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/text_field.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final forgotPasswordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    forgotPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.grey,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Enter your email', style: TextStyle(
            fontSize: 25, fontWeight: FontWeight.bold
          ),),
          SizedBox(height: 10,),
          MyTextFiled(
              label: 'Enter your email',
              controllerText: forgotPasswordController,
              obscureText: false),
          SizedBox(height: 10,),
          MaterialButton(
            color: Color(0xFF00DFD5),
            onPressed: passwordReset,
            child: Text('Reset Password'),
          )
        ],
      ),
    );
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: forgotPasswordController.text.trim());
      errorMessage(context, 'Check your email to use ');
    } on FirebaseAuthException catch (e) {
      print(e);
      errorMessage(context, e.message.toString());
    }

    forgotPasswordController.clear();
    Navigator.pop(context);

  }
  //error message
  void errorMessage(BuildContext context, String text) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(text),
        );
      },
    );
  }
}
