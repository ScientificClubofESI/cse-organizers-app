import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cse_organizers_app/models/task.dart';
import 'package:cse_organizers_app/services/date_time_service.dart';

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

  // Stream<List<OrganizerStatus>> getOccupationStatus(String event, String day) {
  //   return FirebaseFirestore.instance
  //       .collection('Events')
  //       .doc(event)
  //       .collection(day)
  //       .snapshots()
  //       .map((QuerySnapshot tasksSnapshot) {
  //     List<OrganizerStatus> organizersNotFree = [];

  //     tasksSnapshot.docs.forEach((QueryDocumentSnapshot taskDoc) {
  //       List<String> organizers = taskDoc.get('organizers').toList();
  //       DateTime startDate = taskDoc.get('start-date').toDate();
  //       DateTime endDate = taskDoc.get('end-date').toDate();
  //       DateTime currentDate = DateTime.now();
  //       List<OrganizerStatus> organizerStatus = [];

  //       if (currentDate.isAfter(startDate) && currentDate.isBefore(endDate)) {
  //         for (var organizer in organizers) {
  //           organizerStatus.add(OrganizerStatus(
  //               organizer_id: organizer, task_title: taskDoc.get('title')));

  //           organizersNotFree.addAll(organizerStatus);
  //         }
  //       }
  //     });

  //     return organizersNotFree;
  //   });
  // }
}
