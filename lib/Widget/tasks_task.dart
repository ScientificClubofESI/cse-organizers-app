import 'package:cse_organizers_app/Widget/tasks_ScanButton.dart';
import 'tasks_Participant_Button.dart';
import 'package:flutter/material.dart';
import 'package:cse_organizers_app/constants.dart' as constants;
import 'package:auto_size_text/auto_size_text.dart';

class Task extends StatelessWidget {
  final bool normal_task;
  final String task_type;
  final String hour;
  final String task_content;
  const Task({
    super.key,
    required this.normal_task,
    required this.task_type,
    required this.hour,
    required this.task_content,
  });

  @override
  Widget build(BuildContext context) {
    final double largeur = MediaQuery.of(context).size.width;
    final double hauteur = MediaQuery.of(context).size.height;

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            height: hauteur * 0.06,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: largeur * 0.6,
                  child: AutoSizeText(task_type,
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: "CSEOrganizersApp",
                        color: constants.colors['neutral']![900],
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1),
                ),
                Container(
                  width: largeur * 0.3,
                  child: Row(
                    children: [
                      Container(
                        width: largeur * 0.05,
                        child: Icon(
                          Icons.access_time_rounded,
                          color: constants.colors['neutral']![900],
                          size: largeur * 0.05,
                        ),
                      ),
                      Container(
                        width: largeur * 0.2,
                        child: AutoSizeText(
                          hour,
                          style: TextStyle(
                            color: constants.colors['neutral']![900],
                            fontFamily: "CSEOrganizersApp",
                            fontSize: 16,
                          ),
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: hauteur * 0.07,
                child: Container(
                  child: AutoSizeText(
                    task_content,
                    style: TextStyle(
                      fontSize: 16,
                      color: constants.colors['neutral']![900],
                    ),
                    // maxLines: 2,
                  ),
                ),
              ),
              if (normal_task == false)
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: hauteur * 0.01,
                      child: const Divider(
                        height: 1,
                        thickness: 1,
                        color: Colors.black, //constants.colors['neutral']![900]
                      ),
                    ),
                    SizedBox(
                      height: hauteur * 0.09,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ScanButton(name: 'Scan', deg: 10),
                            ParticipantButton(name: 'Participants', deg: 10)
                          ]),
                    )
                  ],
                )
            ],
          )
        ],
      ),
    );
  }
}
