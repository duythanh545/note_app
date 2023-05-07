import 'package:flutter/material.dart';

class MyTextFiled extends StatelessWidget {
  final String label;
  final TextEditingController controllerText;
  final bool obscureText;


  const MyTextFiled({Key? key, required this.label, required this.controllerText, required this.obscureText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controllerText,
      decoration: InputDecoration(
          label: Text(label, style: TextStyle(color: Color(0xFF00ABE9)),),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF00ABE9))),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF00DFD5)),
          )),
      obscureText: obscureText,
    );
  }
}
