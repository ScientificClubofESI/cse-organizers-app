import 'package:cloud_firestore/cloud_firestore.dart';

import 'classes.dart';


class DatabaseService {
  final String uid;


  DatabaseService({required this.uid});

  //Collectoin reference
  final CollectionReference organizerCollection =
  FirebaseFirestore.instance.collection('Organizer');




  Organizer _organizer(DocumentSnapshot snapshot) {
    return Organizer(id: snapshot.id, nom: snapshot.get("nom"), prenom: snapshot.get("prenom"),phone:snapshot.get("phone"));
  }

  Stream<Organizer> get organizer {
    return organizerCollection
        .doc(uid)
        .snapshots()
        .map((snapshot) => _organizer(snapshot));
  }


  updateIsScanned(String task) {
    FirebaseFirestore.instance
        .collection('task_users').doc(task+uid).update({'isScanned':true});
  }





  }












