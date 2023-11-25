import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cse_organizers_app/data/user_data.dart';
import 'package:cse_organizers_app/models/organizer.dart';
import 'package:cse_organizers_app/models/task.dart';

Future<void> getTasks() async {
  QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
      .instance
      .collection("organisateurs")
      .doc(UserData.uid)
      .collection("tasks")
      .get(const GetOptions());
  UserData.tasks = [];
  querySnapshot.docs.forEach((element) {
    UserData.tasks.add(Task(
        id: element.id,
        title: element.data()["title"],
        description: element.data()["description"],
        rawStartTime: element.data()["start_time"],
        rawEndTime: element.data()["end_time"],
        organizers: ["Selmane"],
        checkIn: false));
  });
}

Future<void> getOrganizers() async {
  QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
      .instance
      .collection("organisateurs")
      .get(const GetOptions());
  for (var organizer in querySnapshot.docs) {
    if (UserData.email != organizer.data()["mail"]) {
      UserData.organizers.add(Organizer(
          id: organizer.id,
          fullName: organizer.data()["name"],
          phone: organizer.data()["phone_number"],
          email: organizer.data()["mail"],
          free: organizer.data()["free"]));
    }
  }
}
