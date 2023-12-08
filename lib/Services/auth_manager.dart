import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cse_organizers_app/Services/data_manager.dart';
import 'package:cse_organizers_app/Services/event_service.dart';
import 'package:cse_organizers_app/data/event_data.dart';
import 'package:cse_organizers_app/data/user_data.dart';
import 'package:cse_organizers_app/models/event.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<void> signIn(String email, String password, BuildContext context) async {
  try {
    print("------------------------");

    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    UserData.uid = credential.user!.uid;
    await getTasks();
    await getOrganizers();

    // initialisation de notre evenement je prends tjr la 1ere case
    EventsData.events = (await EventService.getEventslist())!;
    EventsData.eventInfo = EventsData.events[0];
    print(EventsData.eventInfo!.id);
    await getParticipants('rh51g2ICQPTSJaB9V8tr');
    print("auth");
    print(UserData.participants[0].fullName);

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
