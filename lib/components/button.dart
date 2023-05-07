import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  Function()? onTap;
  final String title;

  MyButton({Key? key, required this.onTap, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 3),
            borderRadius: BorderRadius.circular(4)),
        child: Center(
            child: Text(
          title,
          style: TextStyle(fontSize: 25, color: Colors.grey),
        )),
      ),
    );
  }
}
