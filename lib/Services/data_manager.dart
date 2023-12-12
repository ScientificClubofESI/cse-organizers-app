import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cse_organizers_app/data/event_data.dart';
import 'package:cse_organizers_app/data/user_data.dart';
import 'package:cse_organizers_app/models/event.dart';
import 'package:cse_organizers_app/models/organizer.dart';
import 'package:cse_organizers_app/models/participant.dart';
import 'package:cse_organizers_app/models/task.dart';

Future<void> getTasks() async {
  QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
      .instance
      .collection("organisateurs")
      .doc(UserData.uid)
      .collection("tasks")
      .get(const GetOptions());
  UserData.tasks = [];

  querySnapshot.docs.forEach((element) {
    UserData.tasks.add(Task(
        id: element.id,
        title: element.data()["title"],
        description: element.data()["description"],
        rawStartTime: element.data()["start_time"],
        rawEndTime: element.data()["end_time"],
        organizers: ["yas"],
        day: element.data()["day"],
        checkIn: element.data()["checkIn"]));
  });
}

Future<void> getOrganizers() async {
  QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
      .instance
      .collection("organisateurs")
      .get(const GetOptions());
  for (var organizer in querySnapshot.docs) {
    if (UserData.email != organizer.data()["mail"]) {
      UserData.organizers.add(Organizer(
          id: organizer.id,
          fullName: organizer.data()["name"],
          phone: organizer.data()["phone_number"],
          email: organizer.data()["mail"],
          free: organizer.data()["free"]));
    }
  }
}

Future<void> getParticipants(String event) async {
  QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
      .instance
      .collection("Events")
      .doc(event)
      .collection("participants")
      .get(const GetOptions());
  for (var participant in querySnapshot.docs) {
    UserData.participants.add(Participants(
      id: participant.id,
      fullName: participant.data()["fullName"],
      phone: participant.data()["phone"],
      team: participant.data()['team'],
      scannedbool: participant.data()['scannedbool'],
    ));
  }
}

Future<void> updateFreeOrgnizers(bool free) async {
  try {
    await FirebaseFirestore.instance
        .collection('organisateurs')
        .doc(UserData.uid)
        .set({
      'free': free,
    }, SetOptions(merge: true));
  } catch (e) {
    print('Erreur lors de la mise à jour des données : $e');
  }
}

Future<void> updateScannedParticipants(String uid, bool scanned) async {
  try {
    await FirebaseFirestore.instance
        .collection('Events')
        .doc(EventsData.eventInfo!.id)
        .collection('participants')
        .doc(uid)
        .set({
      'scannedbool': scanned,
    }, SetOptions(merge: true));
  } catch (e) {
    print('Erreur lors de la mise à jour des données : $e');
  }
}

Future<List<String>> getAgenda() async {
  try {
    DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
        .collection('Agenda')
        .doc('i29bNATGu7uA24ce3MxU')
        .get();

    if (documentSnapshot.exists) {
      List<String> agendaArray = List<String>.from(documentSnapshot['days']);
      return agendaArray;
    } else {
      // Document not found
      print('Document not found');
      return [];
    }
  } catch (e) {
    print('Error getting agenda: $e');
    return [];
  }
}
