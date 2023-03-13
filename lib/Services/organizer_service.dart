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

  Future<List<Organizer>?> getOrganizerslist() async {
    try {
      final organizersSnapshot = await FirebaseFirestore.instance
          .collection('Event')
          .doc(event)
          .collection('Organizers')
          .get();

      return _organizerslist(organizersSnapshot);
    } catch (e) {
      return null;
    }
  }

  Future<Map<String, String?>?> getOccupationStatus(DateTime now) async {
    try {
      final Map<String, String?> status = {};

      for (Organizer organizer in (await getOrganizerslist())!) {
        status[organizer.id] = null;
      }

      for (Task task in (await TaskService(
        event: event,
        day: now,
      ).getTasklist())!) {
        final DateTime startTime = DateTime(
          now.year,
          now.month,
          now.day,
          task.startTime.hour,
          task.startTime.minute,
        );

        final DateTime endTime = DateTime(
          now.year,
          now.month,
          now.day,
          task.endTime.hour,
          task.endTime.minute,
        );

        if (now.isBefore(startTime) || now.isAfter(endTime)) {
          continue;
        }

        for (String organizerID in task.organizers) {
          status[organizerID] = task.title;
        }
      }

      return status;
    } catch (e) {
      return null;
    }
  }
}
