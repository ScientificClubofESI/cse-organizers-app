import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cse_organizers_app/models/organizer.dart';
import 'package:cse_organizers_app/models/task.dart';
import 'package:cse_organizers_app/services/task_service.dart';

class OrganizerService {
  final String event;

  OrganizerService({required this.event});

  List<Organizer> _organizerslist(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Organizer(
        id: doc.id,
        fullName: doc.get("full-name"),
        phone: doc.get("phone"),
      );
    }).toList();
  }

  Future<List<Organizer>> getOrganizerslist() async {
    final organizersSnapshot = await FirebaseFirestore.instance
        .collection('Event')
        .doc(event)
        .collection('Organizers')
        .get();

    return _organizerslist(organizersSnapshot);
  }

  Future<Map<String, String?>> getOccupationStatus(DateTime day) async {
    final Map<String, String?> status = {};

    for (Organizer organizer in await getOrganizerslist()) {
      status[organizer.id] = null;
    }

    for (Task task in await TaskService(event: event, day: day).getTasklist()) {
      for (String organizerID in task.organizers) {
        status[organizerID] = task.title;
      }
    }

    return status;
  }
}
