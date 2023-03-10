import 'dart:ffi';

class Organizer{
  final String id,nom,prenom;
  final num phone;
  Organizer( {required this.phone,required this.id,required this.nom,required this.prenom});
}

class Event{
  final String id,title,description;
  final  startDate,endDate , days;


  Event({required this.id,required this.title,required this.endDate,required this.description,required this.startDate,required this.days});
}
class Task{
  final String id,title,description;
  final DateTime startDate ,endDate;
  final  organizers;


  Task( {required this.id,required this.title,required this.startDate,required this.endDate,required this.organizers,required this.description});
}
class TaskUser{
  final String taskId,UserId;
  final Bool isScanned;


  TaskUser({required this.taskId, required this.UserId,required this.isScanned});
}