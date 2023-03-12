import 'package:flutter/material.dart';
import 'package:cse_organizers_app/constants.dart' as constants;
import 'package:cse_organizers_app/Widget/tasks_task.dart';

class TaskList extends StatefulWidget {
  List<Task> listTask = [];

  TaskList({
    super.key,
    required this.listTask,
  });

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    final largeur = MediaQuery.of(context).size.width;
    final hauteur = MediaQuery.of(context).size.height;

    return Expanded(
        child: ListView.builder(
      itemCount: widget.listTask.length,
      itemBuilder: (context, index) {
        return Container(
          width: largeur * 0.89,
          padding: EdgeInsets.all(9),
          margin: EdgeInsets.only(left: 9.5, right: 9.5, top: 9),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: constants.colors['shades']!['white']),
          child: widget.listTask[index],
        );
      },
    ));
  }
}
