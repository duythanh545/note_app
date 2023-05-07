import 'package:flutter/material.dart';

Future showAccountDetail(
    BuildContext context, String title, String email, String password) async {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: SingleChildScrollView(
          child: Column(
            children: [
              textField(title, 'Title', false),
              const SizedBox(
                height: 20,
              ),
              textField(password, 'Password', false),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      );
    },
  );
}

Widget textField(String title, String label, bool obscureText) {
  final textFieldController = TextEditingController();
  textFieldController.text = title;
  return TextField(
    controller: textFieldController,
    enabled: false,
    style: TextStyle(fontSize: 20),
    decoration: InputDecoration(
        label: Text(
          label,
          style: TextStyle(color: Color(0xFF00ABE9)),
        ),
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF00DFD5)),
        )),
    obscureText: obscureText,
  );
}