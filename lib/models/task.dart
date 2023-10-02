import 'package:cse_organizers_app/services/date_time_service.dart';
import 'package:intl/intl.dart';

class Task {
  final String id, title, description, rawStartTime, rawEndTime;
  DateTime startTime = DateTime(2023, 10, 2, 14, 0, 0);
  DateTime endTime = DateTime(2023, 10, 2, 16, 0, 0);
  final bool checkIn;
  final List<String> organizers;
  final List<String>? checkedParticipants;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.rawStartTime,
    required this.rawEndTime,
    required this.organizers,
    required this.checkIn,
    this.checkedParticipants,
  }) {
    //startTime = DateTime(2023, 10, 2, 14, 0, 0);
    //endTime = DateTime(2023, 10, 2, 16, 0, 0);
  }
}
