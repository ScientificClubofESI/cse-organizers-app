import 'package:cloud_firestore/cloud_firestore.dart';

import 'classes.dart';


class DatabaseService {
  final String uid;


  DatabaseService({required this.uid});





  Future<void> addUserToTask(String taskId,String event,String day) async {
    try {
  
      DocumentReference taskDoc = FirebaseFirestore.instance.collection('Events').doc(event).collection(day).doc(taskId);

      await taskDoc.update({
        'checked': FieldValue.arrayUnion(uid)
      });

    } catch (e) {
      print(e);
    }
  }





  }












