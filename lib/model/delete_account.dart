import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

CollectionReference account = FirebaseFirestore.instance.collection('account');

Future showDeleteAlert(BuildContext context, String document) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Delete account?'),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel')),
            const SizedBox(width: 10),
            ElevatedButton(onPressed: () {
              deleteAccount(document);
              Navigator.pop(context);
            }, child: Text('Delete'))
          ],
        )
      );
    },
  );
}

Future<void> deleteAccount(String document) {
  return account
      .doc(document)
      .delete()
      .then((value) => print("Account Deleted"))
      .catchError((error) => print("Failed to delete user: $error"));
}
