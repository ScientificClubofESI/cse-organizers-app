import 'package:intl/intl.dart';

class DateTimeService {
  static DateTime now() {
    return DateTime.now();
  }

  static String formatDay(DateTime day) {
    return DateFormat('dd-MM-yyyy').format(day);
  }

  static String formatTime(DateTime time) {
    return DateFormat('HH:mm').format(time);
  }

  static DateTime parseDay(String day) {
    return DateFormat('dd-MM-yyyy').parse(day);
  }

  static DateTime parseTime(String time) {
    return DateFormat('HH:mm').parse(time);
  }
}
