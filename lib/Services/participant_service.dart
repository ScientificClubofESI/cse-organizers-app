import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cse_organizers_app/models/participant.dart';

class ParticipantService {
  final String event;

  ParticipantService({required this.event});

  static List<Participants> _participantslist(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Participants(
        id: doc.id,
        fullName: doc.get("full-name"),
        phone: doc.get("phone"),
        team: doc.get("team"),
        scannedbool: doc.get('scannedbool'),
      );
    }).toList();
  }

  Future<List<Participants>?> getParticipantslist() async {
    try {
      final participantsSnapshot = await FirebaseFirestore.instance
          .collection('Event')
          .doc(event)
          .collection('Participants')
          .get();

      return _participantslist(participantsSnapshot);
    } catch (e) {
      return null;
    }
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
