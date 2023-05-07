import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../components/text_field.dart';

Future showAddAccountForm(
    BuildContext context
    ) async {
  final titleController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Add Account'),
        content: SingleChildScrollView(
          child: Column(
            children: [
              MyTextFiled(
                  label: 'title',
                  controllerText: titleController,
                  obscureText: false),
              const SizedBox(
                height: 20,
              ),
              MyTextFiled(
                  label: 'Email',
                  controllerText: emailController,
                  obscureText: false),
              const SizedBox(
                height: 20,
              ),
              MyTextFiled(
                  label: 'Password',
                  controllerText: passwordController,
                  obscureText: false),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        titleController.clear();
                        emailController.clear();
                        passwordController.clear();
                        Navigator.pop(context);
                      },
                      child: Text('Cancel')),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        addAccountToFirestore(
                            titleController.text, emailController.text, passwordController.text);
                        titleController.clear();
                        passwordController.clear();
                        emailController.clear();
                        Navigator.pop(context);
                      },
                      child: Text('Add'))
                ],
              )
            ],
          ),
        ),
      );
    },
  );
}

Future<void> addAccountToFirestore(String title,String email, String password) {
  CollectionReference accounts = FirebaseFirestore.instance.collection('account');
  // Call the user's CollectionReference to add a new user
  return accounts
      .add({
        'title': title,
        'email': email,
        'password': password,
      })
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}
