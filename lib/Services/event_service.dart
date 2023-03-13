import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cse_organizers_app/models/event.dart';
import 'package:cse_organizers_app/models/organizer.dart';

abstract class EventService {
  static List<Event> _eventslist(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Event(
        id: doc.id,
        name: doc.get('name'),
        days: doc.get('days'),
      );
    }).toList();
  }

  static Future<List<Event>> getEventslist() async {
    final QuerySnapshot eventsSnapshot =
        await FirebaseFirestore.instance.collection('Events').get();
    return _eventslist(eventsSnapshot);
  }
}
