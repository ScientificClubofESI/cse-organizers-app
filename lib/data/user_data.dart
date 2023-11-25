import 'package:cse_organizers_app/models/organizer.dart';
import 'package:cse_organizers_app/models/task.dart';

class UserData {
  static String? uid;
  static String? email;
  static List<Task> tasks = []; // tasks list
  static List<Organizer> organizers = []; // organizers list
}
