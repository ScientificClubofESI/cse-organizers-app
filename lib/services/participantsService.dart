import 'dart:ffi';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'models/participant.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

class participantService {
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('Events');

  //GET all participants
  Future<List<Map<String, dynamic>>> getParticipants(
      String eventId, String dayNumber, String taskId) async {
    //get the list of checked participants
    final event = await collection.doc(eventId).get();
    String date = event.get(dayNumber); //get the date of the dayNumber'th day
    final task = await collection
        .doc(eventId)
        .collection(date)
        .doc(taskId)
        .get(); //get the checkIn task
    List<String>? checked = task.data()?['checked'];

    final QuerySnapshot<Map<String, dynamic>> partcipantsSnapshot =
        await collection.doc(eventId).collection('Participants').get();

    //return the list of participants including their data, id
    //and scanned (true if the participant is scanned, else false)
    return partcipantsSnapshot.docs
        .map((doc) => {
              'id': doc.id,
              'scanned': checked?.contains(doc.id) ?? false,
              'data': doc.data(),
            })
        .toList();
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
