import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:note_app/model/edit_account.dart';

import '../model/add_account.dart';
import '../model/delete_account.dart';
import '../model/read_data.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser;
  final Stream<QuerySnapshot> accountSnapshot =
      FirebaseFirestore.instance.collection('account').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Appbar
      appBar: AppBar(
        title: Text(
          user!.email.toString(),
          style: TextStyle(color: Colors.grey),
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: signOut,
              icon: const Icon(
                Icons.logout,
                color: Colors.grey,
              ))
        ],
      ),
      //body
      body: Container(
        margin: EdgeInsets.all(5),
        child: StreamBuilder<QuerySnapshot>(
          stream: accountSnapshot,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const LinearProgressIndicator();
            }

            return ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(5)),
                  child: ListTile(
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            onPressed: () => editAccountForm(
                                context,
                                snapshot.data!.docs[index].id,
                                '${snapshot.data!.docs[index]['title']}',
                                '${snapshot.data!.docs[index]['email']}',
                                '${snapshot.data!.docs[index]['password']}'),
                            icon: const Icon(Icons.edit)),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () => showDeleteAlert(
                              context, snapshot.data!.docs[index].id),
                        ),
                      ],
                    ),
                    onTap: () => showAccountDetail(
                        context,
                        '${snapshot.data!.docs[index]['title']}',
                        '${snapshot.data!.docs[index]['email']}',
                        '${snapshot.data!.docs[index]['password']}'),
                    title: Text('${snapshot.data!.docs[index]['title']}'),
                  ),
                );
              },
              itemCount: snapshot.data?.docs.length,
            );
          },
        ),
      ),
      //floatingActionButton
      floatingActionButton: FloatingActionButton(
        onPressed: () => showAddAccountForm(context),
        child: const Text('+'),
      ),
    );
  }

  signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
