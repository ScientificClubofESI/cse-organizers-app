
class Organizer{
  final String id,nom,team;
  final num phone;
  Organizer( {required this.phone,required this.id,required this.nom,required this.team});
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
