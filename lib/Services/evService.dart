


import 'package:cloud_firestore/cloud_firestore.dart';


import 'classes.dart';


class EventService {





  //Collectoin reference
  final CollectionReference eventCollection =
  FirebaseFirestore.instance.collection('Events');



  /// *********************get all the existed event *******************/

  List<Event> _eventlist(QuerySnapshot snapshot) {
  return snapshot.docs.map((doc) {

    return Event(id: doc.id, title: doc.get('Name').toString(), endDate: doc.get('end-date').toDate(), description: doc.get('description').toString(), startDate: doc.get('start-date').toDate(), days: doc.get('Days'));
  }).toList();
}

Stream<List<Event>>  Eventlist() {
  return FirebaseFirestore.instance.collection('Events')
      .snapshots()
      .map((snapshot) => _eventlist(snapshot));
}
/// *********************get all the task in one day *******************/
  List<Task> _tasklist(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {

      return Task(id: doc.id, title: doc.get('title').toString(), endDate: doc.get('end-date').toDate(), description: doc.get('description').toString(), startDate: doc.get('startDate').toDate(), organizers:doc.get('organizers') );
    }).toList();
  }

  Stream<List<Task>>  tasklist (String event,String date) {
    return FirebaseFirestore.instance.collection('Event').doc(event).collection(date)
        .snapshots()
        .map((snapshot) => _tasklist(snapshot));
  }

  /// *********************get all the participents in one day *******************/
  List<Organizer> _participentslist(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {

      return Organizer(id: doc.id, nom: doc.get("full-name"), team: doc.get("team"),phone:doc.get("phone"));
    }).toList();
  }

  Stream<List<Organizer>>  participentlist (String event) {
    return FirebaseFirestore.instance.collection('Event').doc(event).collection('Participents')
        .snapshots()
        .map((snapshot) => _participentslist(snapshot));
  }

  /// *********************get all the Organizers in one day *******************/

  Stream<List<Organizer>>  organizerlist (String event) {
    return FirebaseFirestore.instance.collection('Event').doc(event).collection('Organizers')
        .snapshots()
        .map((snapshot) => _participentslist(snapshot));
  }

  /// ********************* is user free or not *******************/


  Future<bool> isUserFree(String userId,String event,String day ) async {

    QuerySnapshot tasksSnapshot = await FirebaseFirestore.instance.collection('Events').doc(event).collection(day).get();


    for (QueryDocumentSnapshot taskDoc in tasksSnapshot.docs) {

      if (taskDoc.get('organizers').contains(userId) ) {

        DateTime startDate = taskDoc.get('start-date').toDate();
        DateTime endDate = taskDoc.get('end-date').toDate();
        DateTime currentDate = DateTime.now();
        if (currentDate.isAfter(startDate) && currentDate.isBefore(endDate)) {

          return false;
        }
      }
    }
    return true;
  }



  /// *********************get all the tasks for one user *******************/



  Stream<List<Task>> UserTasks(String userId, String event ,String day) {

    Query tasksQuery = FirebaseFirestore.instance.collection('Events').doc(event).collection(day).where('organizers', arrayContains: userId);

    return tasksQuery.snapshots().map((querySnapshot) {

      return querySnapshot.docs.map((doc) {
        return Task(id: doc.id, title: doc.get('title').toString(), endDate: doc.get('end-date').toDate(), description: doc.get('description').toString(), startDate: doc.get('startDate').toDate(), organizers:doc.get('organizers') );
      }).toList();
    });
  }



}