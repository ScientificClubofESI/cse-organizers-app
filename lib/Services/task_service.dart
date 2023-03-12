import 'package:cloud_firestore/cloud_firestore.dart';

import 'classes.dart';

class TaskService {
  final String event,day;

  TaskService({required this.event,required this.day});



  /// *********************get all the task in one day *******************/
  List<Task> _tasklist(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Task(
          id: doc.id,
          title: doc.get('title').toString(),
          endDate: doc.get('end-date').toDate(),
          description: doc.get('description').toString(),
          startDate: doc.get('start-date').toDate(),
          organizers: doc.get('organizers'));
    }).toList();
  }

  Stream<List<Task>> tasklist() {
    return FirebaseFirestore.instance
        .collection('Events')
        .doc(event)
        .collection(day)
        .snapshots()
        .map((snapshot) => _tasklist(snapshot));
  }



  /// *********************get all the tasks for one organizer *******************/

  Stream<List<Task>> organizerTasks(String userId) {
    Query tasksQuery = FirebaseFirestore.instance
        .collection('Events')
        .doc(event)
        .collection(day)
        .where('organizers', arrayContains: userId);

    return tasksQuery.snapshots().map((querySnapshot) {
      return querySnapshot.docs.map((doc) {
        return Task(
            id: doc.id,
            title: doc.get('title').toString(),
            endDate: doc.get('end-date').toDate(),
            description: doc.get('description').toString(),
            startDate: doc.get('start-date').toDate(),
            organizers: doc.get('organizers'));
      }).toList();
    });
  }

  /// *********************  organizers not free *******************/

  Stream<List<OrganizerStatus>> getOccupationStatus() {
    return FirebaseFirestore.instance
        .collection('Events')
        .doc(event)
        .collection(day)
        .snapshots()
        .map((QuerySnapshot tasksSnapshot) {
      List<OrganizerStatus> organizersNotFree = [];

      tasksSnapshot.docs.forEach((QueryDocumentSnapshot taskDoc) {
        List<String> organizers = taskDoc.get('organizers').toList();
        DateTime startDate = taskDoc.get('start-date').toDate();
        DateTime endDate = taskDoc.get('end-date').toDate();
        DateTime currentDate = DateTime.now();
        List<OrganizerStatus> organizerStatus=[];

        if (currentDate.isAfter(startDate) && currentDate.isBefore(endDate)) {
          for (var organizer in organizers){

            organizerStatus.add(
                OrganizerStatus(
                    organizer_id: organizer,
                    task_title: taskDoc.get('title')
                ));

            organizersNotFree.addAll(organizerStatus);
          }
        }

      });

      return organizersNotFree;
    });
  }


}
