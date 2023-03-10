


import 'package:cloud_firestore/cloud_firestore.dart';


import 'classes.dart';


class EventService {





  //Collectoin reference
  final CollectionReference eventCollection =
  FirebaseFirestore.instance.collection('Event');



  /// *********************get all the existed event *******************/

  List<Event> _eventlist(QuerySnapshot snapshot) {
  return snapshot.docs.map((doc) {

    return Event(id: doc.id, title: doc.get('title').toString(), endDate: doc.get('endDate').toDate(), description: doc.get('description').toString(), startDate: doc.get('startDate').toDate(), days: doc.get('days'));
  }).toList();
}

Stream<List<Event>>  Eventlist() {
  return FirebaseFirestore.instance.collection('Event')
      .snapshots()
      .map((snapshot) => _eventlist(snapshot));
}
/// *********************get all the task in one day *******************/
  List<Task> _tasklist(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {

      return Task(id: doc.id, title: doc.get('title').toString(), endDate: doc.get('endDate').toDate(), description: doc.get('description').toString(), startDate: doc.get('startDate').toDate(), organizers:doc.get('organizers') );
    }).toList();
  }

  Stream<List<Task>>  tasklist (String event,String date) {
    return FirebaseFirestore.instance.collection('Event').doc(event).collection(date)
        .snapshots()
        .map((snapshot) => _tasklist(snapshot));
  }

  /// ********************* is user free or not *******************/

  bool isUserFree(String userId ,String event,String day) {
    bool isFree = true;

    DateTime now = DateTime.now();

    FirebaseFirestore.instance.collection('task_users')
        .where('userId', isEqualTo: userId)
        .get()
        .then((querySnapshot) {
      for (var doc in querySnapshot.docs) {
        // Get the task document
        FirebaseFirestore.instance.collection('Event').doc(event).collection('day')
            .doc(doc['taskId'])
            .get()
            .then((taskDoc) {

          DateTime startDate = taskDoc.get('startDate').toDate();
          DateTime endDate = taskDoc.get('endDate').toDate();
          if (startDate.isBefore(now) && endDate.isAfter(now)) {
            isFree = false;
          }
        });
      }
    });

    return isFree;
  }


/// *********************get all the organizers for one task *******************/

  Stream<List<TaskUser>> getTaskOrganizers(String taskId) {
    return FirebaseFirestore.instance
        .collection('Task_users')
        .where('taskId', isEqualTo: taskId)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {return TaskUser(taskId: taskId, UserId: doc.get('userId').toString(), isScanned: doc.get('isScanned'));}).toList();
    });
  }


  /// *********************get all the tasks for one user *******************/

  Stream<List<TaskUser>> getUserTasks(String userId) {
    return FirebaseFirestore.instance
        .collection('task_users')
        .where('userId', isEqualTo: userId)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {return TaskUser(taskId: doc.get('taskId').toString(), UserId:userId , isScanned: doc.get('isScanned'));}).toList();
    });
  }

  /// *********************  isUserFreeAsStream   *******************/

  Stream<bool> isUserFreeAsStream(String userId) {
    return FirebaseFirestore.instance
        .collection('task_users')
        .where('userId', isEqualTo: userId)
        .snapshots()
        .asyncMap((snapshot) async {
      for (DocumentSnapshot doc in snapshot.docs) {
        String taskId = doc['taskId'];
        DocumentSnapshot taskDoc = await FirebaseFirestore.instance
            .collection('tasks')
            .doc(taskId)
            .get();
        DateTime firstDate = taskDoc['firstDate'].toDate();
        DateTime lastDate = taskDoc['lastDate'].toDate();
        if (DateTime.now().isAfter(firstDate) && DateTime.now().isBefore(lastDate)) {
          return false;
        }
      }
      return true;
    });
  }

}