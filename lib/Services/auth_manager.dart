import 'package:cse_organizers_app/Services/data_manager.dart';
import 'package:cse_organizers_app/Services/event_service.dart';
import 'package:cse_organizers_app/data/event_data.dart';
import 'package:cse_organizers_app/data/user_data.dart';
import 'package:cse_organizers_app/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<bool> signIn(String email, String password, BuildContext context) async {
  try {
    print("------------------------");

    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    UserData.uid = credential.user!.uid;
    await getTasks();
    await getOrganizers();
    EventsData.agenda = await getAgenda();
    // initialisation de notre evenement je prends tjr la 1ere case
    EventsData.events = (await EventService.getEventslist())!;
    EventsData.eventInfo = EventsData.events[0];
    print(EventsData.eventInfo!.id);
    await getParticipants('rh51g2ICQPTSJaB9V8tr');

    return true;
  } on FirebaseException {
    return false;
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
