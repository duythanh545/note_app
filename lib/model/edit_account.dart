import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

CollectionReference account = FirebaseFirestore.instance.collection('account');
final titleController = TextEditingController();
final emailController = TextEditingController();
final passwordController = TextEditingController();

Future editAccountForm(BuildContext context, String docID, String title,
    String email, String password) async {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(docID),
        content: SingleChildScrollView(
          child: Column(
            children: [
              textField(title, 'Title', titleController),
              const SizedBox(height: 20),
              textField(email, 'Email', emailController),
              const SizedBox(height: 20),
              textField(password, 'Password', passwordController),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Cancel')),
                  const SizedBox(width: 10),
                  ElevatedButton(onPressed: () {
                    editAccount(docID, titleController.text, emailController.text, passwordController.text);
                    Navigator.pop(context);
                  }, child: Text('Save'))
                ],
              )
            ],
          ),
        ),
      );
    },
  );
}

Widget textField(String title, String label, TextEditingController controller) {

  controller.text = title;
  return TextField(
    controller: controller,
    decoration: InputDecoration(
        label: Text(
          label,
          style: TextStyle(color: Color(0xFF00ABE9)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF00DFD5)),
        )),
  );
}

Future<void> editAccount(
    String docID, String title, String email, String password) {
  return account
      .doc(docID)
      .update({
        'title': title
      })
      .then((value) => print("Account Updated"))
      .catchError((error) => print("Failed to update account: $error"));
}
