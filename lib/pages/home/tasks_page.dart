import 'package:cse_organizers_app/constants.dart';
import 'package:cse_organizers_app/icons/c_s_e_organizers_app_icons.dart';
import 'package:cse_organizers_app/models/event.dart';
import 'package:flutter/material.dart';

import '../../models/task.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({super.key});
  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  final List<String> daysList = ['Day 1', 'Day 2', 'Day 3', 'Day 4', 'Day 5'];

  late final Event event;

  int current = 0;

  final List<List<Task>> daysTaskList = <List<Task>>[
    <Task>[
      Task(
          id: '0',
          title: 'Normal Task',
          description:
              'Lorem ipsum dolor sit amet, consetetur adipiscing elit.',
          rawStartTime: '11:00',
          rawEndTime: '12:30',
          organizers: <String>['Member1'],
          checkIn: true),
      Task(
          id: '0',
          title: 'Normal Task',
          description:
              'Lorem ipsum dolor sit amet, consetetur adipiscing elit.',
          rawStartTime: '11:00',
          rawEndTime: '12:30',
          organizers: <String>['Member1'],
          checkIn: true),
      Task(
          id: '1',
          title: 'Check-In Task',
          description:
              'Lorem ipsum dolor sit amet, consetetur adipiscing elit.',
          rawStartTime: '11:00',
          rawEndTime: '12:30',
          organizers: <String>['Member1'],
          checkIn: true),
      Task(
          id: '2',
          title: 'Normal Task',
          description:
              'Lorem ipsum dolor sit amet, consetetur adipiscing elit.',
          rawStartTime: '11:00',
          rawEndTime: '12:30',
          organizers: <String>['Member1'],
          checkIn: true),
      Task(
          id: '4',
          title: 'Check-In Task',
          description:
              'Lorem ipsum dolor sit amet, consetetur adipiscing elit.',
          rawStartTime: '11:00',
          rawEndTime: '12:30',
          organizers: <String>['Member1'],
          checkIn: true),
      Task(
          id: '5',
          title: 'Normal Task',
          description:
              'Lorem ipsum dolor sit amet, consetetur adipiscing elit.',
          rawStartTime: '11:00',
          rawEndTime: '12:30',
          organizers: <String>['Member1'],
          checkIn: true),
      Task(
          id: '6',
          title: 'Check-In Task',
          description:
              'Lorem ipsum dolor sit amet, consetetur adipiscing elit.',
          rawStartTime: '11:00',
          rawEndTime: '12:30',
          organizers: <String>['Member1'],
          checkIn: true)
    ],
    <Task>[
      Task(
          id: '0',
          title: 'Normal Task',
          description:
              'Lorem ipsum dolor sit amet, consetetur adipiscing elit.',
          rawStartTime: '11:00',
          rawEndTime: '12:30',
          organizers: <String>['Member1'],
          checkIn: false),
      Task(
          id: '0',
          title: 'Normal Task',
          description:
              'Lorem ipsum dolor sit amet, consetetur adipiscing elit.',
          rawStartTime: '11:00',
          rawEndTime: '12:30',
          organizers: <String>['Member1'],
          checkIn: false),
      Task(
          id: '1',
          title: 'Normal Task',
          description:
              'Lorem ipsum dolor sit amet, consetetur adipiscing elit.',
          rawStartTime: '11:00',
          rawEndTime: '12:30',
          organizers: <String>['Member1'],
          checkIn: false),
      Task(
          id: '2',
          title: 'Normal Task',
          description:
              'Lorem ipsum dolor sit amet, consetetur adipiscing elit.',
          rawStartTime: '11:00',
          rawEndTime: '12:30',
          organizers: <String>['Member1'],
          checkIn: false),
      Task(
          id: '4',
          title: 'Normal Task',
          description:
              'Lorem ipsum dolor sit amet, consetetur adipiscing elit.',
          rawStartTime: '11:00',
          rawEndTime: '12:30',
          organizers: <String>['Member1'],
          checkIn: false),
      Task(
          id: '5',
          title: 'Normal Task',
          description:
              'Lorem ipsum dolor sit amet, consetetur adipiscing elit.',
          rawStartTime: '11:00',
          rawEndTime: '12:30',
          organizers: <String>['Member1'],
          checkIn: false),
      Task(
          id: '6',
          title: 'Normal Task',
          description:
              'Lorem ipsum dolor sit amet, consetetur adipiscing elit.',
          rawStartTime: '11:00',
          rawEndTime: '12:30',
          organizers: <String>['Member1'],
          checkIn: false)
    ],
    <Task>[
      Task(
          id: '0',
          title: 'Normal Task',
          description:
              'Lorem ipsum dolor sit amet, consetetur adipiscing elit.',
          rawStartTime: '11:00',
          rawEndTime: '12:30',
          organizers: <String>['Member1'],
          checkIn: false),
      Task(
          id: '0',
          title: 'Normal Task',
          description:
              'Lorem ipsum dolor sit amet, consetetur adipiscing elit.',
          rawStartTime: '11:00',
          rawEndTime: '12:30',
          organizers: <String>['Member1'],
          checkIn: false),
      Task(
          id: '1',
          title: 'Check-In Task',
          description:
              'Lorem ipsum dolor sit amet, consetetur adipiscing elit.',
          rawStartTime: '11:00',
          rawEndTime: '12:30',
          organizers: <String>['Member1'],
          checkIn: true),
      Task(
          id: '2',
          title: 'Normal Task',
          description:
              'Lorem ipsum dolor sit amet, consetetur adipiscing elit.',
          rawStartTime: '11:00',
          rawEndTime: '12:30',
          organizers: <String>['Member1'],
          checkIn: false),
      Task(
          id: '4',
          title: 'Check-In Task',
          description:
              'Lorem ipsum dolor sit amet, consetetur adipiscing elit.',
          rawStartTime: '11:00',
          rawEndTime: '12:30',
          organizers: <String>['Member1'],
          checkIn: true),
      Task(
          id: '5',
          title: 'Normal Task',
          description:
              'Lorem ipsum dolor sit amet, consetetur adipiscing elit.',
          rawStartTime: '11:00',
          rawEndTime: '12:30',
          organizers: <String>['Member1'],
          checkIn: false),
      Task(
          id: '6',
          title: 'Check-In Task',
          description:
              'Lorem ipsum dolor sit amet, consetetur adipiscing elit.',
          rawStartTime: '11:00',
          rawEndTime: '12:30',
          organizers: <String>['Member1'],
          checkIn: true)
    ],
    <Task>[
      Task(
          id: '0',
          title: 'Normal Task',
          description:
              'Lorem ipsum dolor sit amet, consetetur adipiscing elit.',
          rawStartTime: '11:00',
          rawEndTime: '12:30',
          organizers: <String>['Member1'],
          checkIn: false),
      Task(
          id: '0',
          title: 'Normal Task',
          description:
              'Lorem ipsum dolor sit amet, consetetur adipiscing elit.',
          rawStartTime: '11:00',
          rawEndTime: '12:30',
          organizers: <String>['Member1'],
          checkIn: false),
      Task(
          id: '1',
          title: 'Check-In Task',
          description:
              'Lorem ipsum dolor sit amet, consetetur adipiscing elit.',
          rawStartTime: '11:00',
          rawEndTime: '12:30',
          organizers: <String>['Member1'],
          checkIn: true),
      Task(
          id: '2',
          title: 'Normal Task',
          description:
              'Lorem ipsum dolor sit amet, consetetur adipiscing elit.',
          rawStartTime: '11:00',
          rawEndTime: '12:30',
          organizers: <String>['Member1'],
          checkIn: false),
      Task(
          id: '4',
          title: 'Check-In Task',
          description:
              'Lorem ipsum dolor sit amet, consetetur adipiscing elit.',
          rawStartTime: '11:00',
          rawEndTime: '12:30',
          organizers: <String>['Member1'],
          checkIn: true),
      Task(
          id: '5',
          title: 'Normal Task',
          description:
              'Lorem ipsum dolor sit amet, consetetur adipiscing elit.',
          rawStartTime: '11:00',
          rawEndTime: '12:30',
          organizers: <String>['Member1'],
          checkIn: false),
      Task(
          id: '6',
          title: 'Check-In Task',
          description:
              'Lorem ipsum dolor sit amet, consetetur adipiscing elit.',
          rawStartTime: '11:00',
          rawEndTime: '12:30',
          organizers: <String>['Member1'],
          checkIn: true)
    ],
    <Task>[
      Task(
          id: '0',
          title: 'Normal Task',
          description:
              'Lorem ipsum dolor sit amet, consetetur adipiscing elit.',
          rawStartTime: '11:00',
          rawEndTime: '12:30',
          organizers: <String>['Member1'],
          checkIn: false),
      Task(
          id: '0',
          title: 'Normal Task',
          description:
              'Lorem ipsum dolor sit amet, consetetur adipiscing elit.',
          rawStartTime: '11:00',
          rawEndTime: '12:30',
          organizers: <String>['Member1'],
          checkIn: false),
      Task(
          id: '1',
          title: 'Check-In Task',
          description:
              'Lorem ipsum dolor sit amet, consetetur adipiscing elit.',
          rawStartTime: '11:00',
          rawEndTime: '12:30',
          organizers: <String>['Member1'],
          checkIn: true),
      Task(
          id: '2',
          title: 'Normal Task',
          description:
              'Lorem ipsum dolor sit amet, consetetur adipiscing elit.',
          rawStartTime: '11:00',
          rawEndTime: '12:30',
          organizers: <String>['Member1'],
          checkIn: false),
      Task(
          id: '4',
          title: 'Check-In Task',
          description:
              'Lorem ipsum dolor sit amet, consetetur adipiscing elit.',
          rawStartTime: '11:00',
          rawEndTime: '12:30',
          organizers: <String>['Member1'],
          checkIn: true),
      Task(
          id: '5',
          title: 'Normal Task',
          description:
              'Lorem ipsum dolor sit amet, consetetur adipiscing elit.',
          rawStartTime: '11:00',
          rawEndTime: '12:30',
          organizers: <String>['Member1'],
          checkIn: false),
      Task(
          id: '6',
          title: 'Check-In Task',
          description:
              'Lorem ipsum dolor sit amet, consetetur adipiscing elit.',
          rawStartTime: '11:00',
          rawEndTime: '12:30',
          organizers: <String>['Member1'],
          checkIn: true)
    ],
    <Task>[
      Task(
          id: '0',
          title: 'Normal Task',
          description:
              'Lorem ipsum dolor sit amet, consetetur adipiscing elit.',
          rawStartTime: '11:00',
          rawEndTime: '12:30',
          organizers: <String>['Member1'],
          checkIn: false),
      Task(
          id: '0',
          title: 'Normal Task',
          description:
              'Lorem ipsum dolor sit amet, consetetur adipiscing elit.',
          rawStartTime: '11:00',
          rawEndTime: '12:30',
          organizers: <String>['Member1'],
          checkIn: false),
      Task(
          id: '1',
          title: 'Check-In Task',
          description:
              'Lorem ipsum dolor sit amet, consetetur adipiscing elit.',
          rawStartTime: '11:00',
          rawEndTime: '12:30',
          organizers: <String>['Member1'],
          checkIn: true),
      Task(
          id: '2',
          title: 'Normal Task',
          description:
              'Lorem ipsum dolor sit amet, consetetur adipiscing elit.',
          rawStartTime: '11:00',
          rawEndTime: '12:30',
          organizers: <String>['Member1'],
          checkIn: false),
      Task(
          id: '4',
          title: 'Check-In Task',
          description:
              'Lorem ipsum dolor sit amet, consetetur adipiscing elit.',
          rawStartTime: '11:00',
          rawEndTime: '12:30',
          organizers: <String>['Member1'],
          checkIn: true),
      Task(
          id: '5',
          title: 'Normal Task',
          description:
              'Lorem ipsum dolor sit amet, consetetur adipiscing elit.',
          rawStartTime: '11:00',
          rawEndTime: '12:30',
          organizers: <String>['Member1'],
          checkIn: false),
      Task(
          id: '6',
          title: 'Check-In Task',
          description:
              'Lorem ipsum dolor sit amet, consetetur adipiscing elit.',
          rawStartTime: '11:00',
          rawEndTime: '12:30',
          organizers: <String>['Member1'],
          checkIn: true)
    ]
  ];
  late List<Task> currentDayTasksList = daysTaskList[current];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    event = Event(id: 'id', name: 'Welcome day', days: daysList);
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: colors['background']!['light'],
      body: Column(
        children: [
          Container(
            height: 190,
            color: colors['shades']!['white'],
            child: Column(
              children: [
                SizedBox(
                  height: screenSize.height / 20,
                ),
                Container(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'My tasks',
                    style: TextStyle(
                      color: colors['neutral']![900],
                      fontFamily: 'CSEOrganizersApp',
                      fontWeight: FontWeight.w600,
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: screenSize.height / 50,
                ),
                Container(
                  width: double.infinity,
                  height: 70,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Center(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: event.days.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              current = index;
                              currentDayTasksList = daysTaskList[current];
                            });
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            height: 45,
                            width: 80,
                            margin: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: current == index
                                  ? colors['primary']![500]
                                  : colors['background']!['light'],
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  event.days[index],
                                  style: TextStyle(
                                    color: (current == index)
                                        ? colors['shades']!['white']
                                        : colors['neutral']![900],
                                    fontFamily: 'CSEOrganizersApp',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: currentDayTasksList.length,
                itemBuilder: (context, index) {
                  if (currentDayTasksList[index].checkIn == true) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 5.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: ListTile(
                          tileColor: (DateTime.now().isAfter(
                                      currentDayTasksList[index].startTime) &&
                                  DateTime.now().isBefore(
                                      currentDayTasksList[index].endTime))
                              ? colors['primary']![100]
                              : colors['shades']!['white'],
                          title: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child:
                                        Text(currentDayTasksList[index].title),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(CSEOrganizersApp.clock),
                                      Text(
                                          ' ${currentDayTasksList[index].rawStartTime} - ${currentDayTasksList[index].rawEndTime}')
                                    ],
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                    currentDayTasksList[index].description),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 16.0),
                                child: Divider(
                                  color: colors['neutral']![900],
                                  thickness: 1,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 16.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    MaterialButton(
                                      onPressed: () {},
                                      color: colors['primary']![500],
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                          children: [
                                            Icon(
                                              CSEOrganizersApp.camera,
                                              color: colors['shades']!['white'],
                                            ),
                                            Text(
                                              'Scan',
                                              style: TextStyle(
                                                  fontFamily:
                                                      'CSEOrganizersApp',
                                                  fontWeight: FontWeight.w600,
                                                  color: colors['shades']![
                                                      'white']),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: screenSize.width / 20,
                                    ),
                                    MaterialButton(
                                      onPressed: () {},
                                      color: colors['shades']!['white'],
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Participants ',
                                              style: TextStyle(
                                                  fontFamily:
                                                      'CSEOrganizersApp',
                                                  fontWeight: FontWeight.w600,
                                                  color: colors['shades']![
                                                      'black']),
                                            ),
                                            Icon(
                                              CSEOrganizersApp.arrow,
                                              color: colors['shades']!['black'],
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8.0),
                      child: Card(
                        child: ListTile(
                          title: Text(currentDayTasksList[index].title),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(CSEOrganizersApp.clock),
                              Text(
                                  ' ${currentDayTasksList[index].rawStartTime} - ${currentDayTasksList[index].rawEndTime}')
                            ],
                          ),
                          subtitle:
                              Text(currentDayTasksList[index].description),
                        ),
                      ),
                    );
                  }
                }),
          )
        ],
      ),
    );
  }
}
