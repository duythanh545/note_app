import 'package:flutter/material.dart';

import '../components/button.dart';
import '../components/text_field.dart';
import '../model/sign_in_model.dart';
import '../service/auth_service.dart';
import 'forgot_password_page.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;

  LoginPage({Key? key, required this.onTap}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

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
                    'Login',
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
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return ForgotPasswordPage();
                              },
                            ));
                          },
                          child: Text('Forgot password?')),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  MyButton(
                    title: 'Sign in',
                    onTap: () => signUserIn(
                        context, emailController, passwordController),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Not a member?'),
                      TextButton(
                          onPressed: widget.onTap, child: Text('Register now'))
                    ],
                  ),
                  const Divider(thickness: 1),
                  InkWell(
                    onTap: () => AuthService().signInWithGoogle(),
                    child: Image.asset('lib/images/google.webp', scale: 25),
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
