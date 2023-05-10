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
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF00DFD5)),
          )),
      obscureText: obscureText,
    );
  }
}

class MyTextFiledPassword extends StatefulWidget {
  final String label;
  final TextEditingController controllerText;



  const MyTextFiledPassword({Key? key, required this.label, required this.controllerText}) : super(key: key);

  @override
  State<MyTextFiledPassword> createState() => _MyTextFiledPasswordState();
}

class _MyTextFiledPasswordState extends State<MyTextFiledPassword> {
   bool isPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controllerText,
      decoration: InputDecoration(
          label: Text(widget.label, style: TextStyle(color: Color(0xFF00ABE9)),),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF00ABE9))),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF00DFD5)),
          ),
        suffixIcon: IconButton(
          icon: isPasswordVisible
              ? Icon(Icons.visibility_off)
              : Icon(Icons.visibility),
          onPressed: () {
            setState(() {
              isPasswordVisible = !isPasswordVisible;
            });
          },
        ),
      ),
      obscureText: isPasswordVisible,
    );
  }
}
