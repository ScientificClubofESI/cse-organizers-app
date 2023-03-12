import 'dart:ffi';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'models/participant.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

class participantService {
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('Events');

  //GET all participants
  Future<List<DocumentSnapshot<Map<String, dynamic>>>> getParticipants(
      String eventId) async {
    final QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await collection.doc(eventId).collection('Participants').get();
    return querySnapshot.docs;
  }

  // GET already checked participants of a specific task in a specific day
  Future<Stream<QuerySnapshot>> getCheckedParticipants(
      String eventId, String dayNumber, String taskId) async {
    final event = await collection.doc(eventId).get();
    String date = event.get(dayNumber); //get the date of the dayNumber'th day
    final task = await collection
        .doc(eventId)
        .collection(date)
        .doc(taskId)
        .get(); //get the checkIn task
    List<String>? checked = task.data()?['checked']
        as List<String>?; //get the list of IDs of checked participants
    return collection
        .doc(eventId)
        .collection('Participants')
        .where(FieldPath.documentId, whereIn: checked ?? [])
        .snapshots(); //return a filtred query of only checked participants
  }

//check a specific participant in a specific day for a specific checkin task
  void checkParticipant(
    String eventId,
    String participantId,
    String taskId,
    String dayNumber,
  ) async {
    final event = await collection.doc(eventId).get();
    String date = event.get(dayNumber); //get the date of the dayNumber'th day
    collection
        .doc(eventId)
        .collection(date)
        .doc(taskId)
        .update({
          "checked": FieldValue.arrayUnion([participantId])
        })
        .then((value) => print('Field updated successfully!'))
        .catchError((error) => print('Failed to update field: $error'));

    //update the checked array of the specified task
  }

  // GET list of unchecked participants of a specific task in a specific day
  Future<Stream<QuerySnapshot>> getUncheckedParticipants(
      String eventId, String dayNumber, String taskId) async {
    final event = await collection.doc(eventId).get();
    String date = event.get(dayNumber); //get the date of the dayNumber'th day
    final task = await collection
        .doc(eventId)
        .collection(date)
        .doc(taskId)
        .get(); //get the checkIn task
    List<String>? checked = task.data()?['checked']
        as List<String>?; //get the list of IDs of checked participants
    return collection
        .doc(eventId)
        .collection('Participants')
        .where(FieldPath.documentId, whereNotIn: checked ?? [])
        .snapshots(); //return a filtred query of only unchecked participants
  }
}
