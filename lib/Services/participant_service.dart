import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cse_organizers_app/models/participant.dart';

class ParticipantService {
  final String event;

  ParticipantService({required this.event});

  static List<Participant> _participantslist(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Participant(
        id: doc.id,
        fullName: doc.get("full-name"),
        phone: doc.get("phone"),
        team: doc.get("team"),
      );
    }).toList();
  }

  Future<List<Participant>> getParticipantslist() async {
    final participantsSnapshot = await FirebaseFirestore.instance
        .collection('Event')
        .doc(event)
        .collection('Participents')
        .get();

    return _participantslist(participantsSnapshot);
  }

  Future<bool> checkParticipant(
    String participantId,
    String taskId,
    String day,
  ) async {
    try {
      DocumentReference taskDoc = FirebaseFirestore.instance
          .collection('Events')
          .doc(event)
          .collection(day)
          .doc(taskId);

      await taskDoc.update({
        'checked': FieldValue.arrayUnion([participantId])
      });

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> uncheckParticipant(
    String participantId,
    String taskId,
    String day,
  ) async {
    try {
      DocumentReference taskDoc = FirebaseFirestore.instance
          .collection('Events')
          .doc(event)
          .collection(day)
          .doc(taskId);

      await taskDoc.update({
        'checked': FieldValue.arrayRemove([participantId])
      });

      return true;
    } catch (e) {
      return false;
    }
  }
}
