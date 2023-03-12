import 'package:cloud_firestore/cloud_firestore.dart';

import 'classes.dart';

class EventService {
  //Collectoin reference
  final CollectionReference eventCollection =
      FirebaseFirestore.instance.collection('Events');

  /// *********************get all the existed event *******************/

  List<Event> _eventlist(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Event(
          id: doc.id,
          title: doc.get('Name').toString(),
          endDate: doc.get('end-date').toDate(),
          description: doc.get('description').toString(),
          startDate: doc.get('start-date').toDate(),
          days: doc.get('Days'));
    }).toList();
  }

  Stream<List<Event>> Eventlist() {
    return FirebaseFirestore.instance
        .collection('Events')
        .snapshots()
        .map((snapshot) => _eventlist(snapshot));
  }


  /// *********************get all the participents in one day *******************/
  List<Organizer> _participentslist(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Organizer(
          id: doc.id,
          full_name: doc.get("full-name"),
          team: doc.get("team"),
          phone: doc.get("phone"));
    }).toList();
  }

  Stream<List<Organizer>> participentlist(String event) {
    return FirebaseFirestore.instance
        .collection('Event')
        .doc(event)
        .collection('Participents')
        .snapshots()
        .map((snapshot) => _participentslist(snapshot));
  }

  /// *********************get all the Organizers in one day *******************/

  Stream<List<Organizer>> organizerlist(String event) {
    return FirebaseFirestore.instance
        .collection('Event')
        .doc(event)
        .collection('Organizers')
        .snapshots()
        .map((snapshot) => _participentslist(snapshot));
  }









}
