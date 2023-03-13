import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cse_organizers_app/models/participant.dart';
import 'package:cse_organizers_app/models/task.dart';
import 'package:cse_organizers_app/services/date_time_service.dart';
import 'package:cse_organizers_app/services/participant_service.dart';

class TaskService {
  final String event;
  final DateTime day;

  TaskService({required this.event, required this.day});

  static List<Task> _tasklist(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Task(
        id: doc.id,
        title: doc.get('title'),
        description: doc.get('description'),
        organizers: doc.get('organizers'),
        rawEndTime: doc.get('end-time'),
        rawStartTime: doc.get('start-time'),
        checkIn: doc.get('check-in'),
        checkedParticipants: doc.get('checked'),
      );
    }).toList();
  }

  Future<List<Task>> getTasklist() async {
    final tasksSnapshot = await FirebaseFirestore.instance
        .collection('Events')
        .doc(event)
        .collection(DateTimeService.formatDay(day))
        .get();

    return _tasklist(tasksSnapshot);
  }

  Future<List<Task>> getOrganizerTasks(String organizer) async {
    final tasksSnapshot = await FirebaseFirestore.instance
        .collection('Events')
        .doc(event)
        .collection(DateTimeService.formatDay(day))
        .where('organizers', arrayContains: organizer)
        .get();

    return _tasklist(tasksSnapshot);
  }

  Future<Stream<Map<String, bool>>> getCheckInStatusStream(
    String taskID,
  ) async {
    final List<Participant> participants =
        await ParticipantService(event: event).getParticipantslist();

    return FirebaseFirestore.instance
        .collection('Events')
        .doc(event)
        .collection(DateTimeService.formatDay(day))
        .doc(taskID)
        .snapshots()
        .map(
      (task) {
        final Map<String, bool> checkInStatus = {};
        for (Participant participant in participants) {
          checkInStatus[participant.id] = false;
        }
        for (String participantID in task.get('checked')) {
          checkInStatus[participantID] = true;
        }
        return checkInStatus;
      },
    );
  }
}
