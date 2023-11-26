import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cse_organizers_app/Services/data_manager.dart';
import 'package:cse_organizers_app/data/user_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<void> signIn(String email, String password, BuildContext context) async {
  try {
    print("------------------------");

    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    UserData.uid = credential.user!.uid;
    Navigator.pushReplacementNamed(context, "/home");

    /*FirebaseFirestore.instance
        .collection('organisateurs')
        .doc(credential.user!.uid)
        .collection("tasks")
        .add({
      "title": "Task 2",
      "description": "Description of task 2",
      "start_time": Timestamp.fromDate(DateTime(2023, 10, 31)),
      "end_time": Timestamp.fromDate(DateTime(2023, 10, 20))
    });*/
    await getTasks();
    await getOrganizers();
  } on FirebaseException catch (e) {
    print(e);
  }
  /*try {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    UserData.email = credential.user!.email;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }
  }*/
}
