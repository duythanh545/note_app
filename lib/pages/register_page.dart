import 'package:flutter/material.dart';

import '../components/button.dart';
import '../components/text_field.dart';
import '../model/sign_up_model.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;

  RegisterPage({Key? key, required this.onTap}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Image.asset(
                    'lib/images/drop.png',
                    height: 100,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Text(
                    'Register',
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  MyTextFiled(
                    label: 'Email',
                    obscureText: false,
                    controllerText: emailController,
                  ),
                  const SizedBox(height: 10),
                  MyTextFiledPassword(
                    label: 'Password',
                    controllerText: passwordController,
                  ),
                  const SizedBox(height: 10),
                  MyTextFiledPassword(
                    label: 'Confirm Password',
                    controllerText: confirmPasswordController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MyButton(
                    title: 'Register',
                    onTap: () => checkPasswordMatch(context, passwordController,
                        confirmPasswordController, emailController),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Already have an account?'),
                      TextButton(
                          onPressed: widget.onTap, child: Text('Login now'))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}