import 'dart:ui';

import 'package:cse_organizers_app/Widget/tasks_ScanButton.dart';
import 'tasks_Participant_Button.dart';
import 'package:cse_organizers_app/icons/c_s_e_organizers_app_icons.dart';
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
                AutoSizeText(task_type,
                    style: TextStyle(
                      fontSize: 14,
                      color: constants.colors['neutral']![900],
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1),
                Row(
                  children: [
                    Icon(
                      Icons.access_time_rounded,
                      color: constants.colors['neutral']![900],
                      size: 14,
                    ),
                    AutoSizeText(
                      hour,
                      style: TextStyle(
                        color: constants.colors['neutral']![900],
                        fontSize: 5,
                      ),
                      maxLines: 1,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: hauteur * 0.07,
                child: AutoSizeText(
                  task_content,
                  style: TextStyle(
                    fontSize: 5,
                    color: constants.colors['neutral']![900],
                  ),
                  maxLines: 2,
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
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: hauteur * 0.09,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ScanButton(name: 'Scan', deg: 10, size: 9),
                            ParticipantButton(
                                name: 'Participants', deg: 10, size: 10)
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
