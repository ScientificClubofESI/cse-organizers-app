import 'package:cse_organizers_app/constants.dart';
import 'package:cse_organizers_app/icons/c_s_e_organizers_app_icons.dart';
import 'package:cse_organizers_app/models/event.dart';
import 'package:cse_organizers_app/pages/home/participants_page.dart';
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
          title: 'Check-In Task',
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
          title: 'Check-In Task',
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
    currentDayTasksList.sort((a, b) => a.startTime.compareTo(b.startTime));
    // to test array sorting -- i'll implement the UI real time change with Provider.
    // Timer.periodic(const Duration(seconds: 1), (timer) {
    //   if (mounted){
    //   setState(() {});
    //   }
    // });
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
                              currentDayTasksList.sort((a, b) => a.startTime.compareTo(b.startTime));
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
                      padding: EdgeInsets.only(
                          top: index == 0 ? 0.0 : 16.0, bottom: 16.0,left :24.0, right : 24.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: (DateTime.now().isAfter(
                              currentDayTasksList[index].startTime) &&
                              DateTime.now().isBefore(
                                  currentDayTasksList[index].endTime))
                              ? colors['primary']![100]
                              : colors['shades']!['white'],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child:
                                          Text(currentDayTasksList[index].title,style: TextStyle(
                                            color: (DateTime.now().isAfter(
                                                currentDayTasksList[index].startTime) &&
                                                DateTime.now().isBefore(
                                                    currentDayTasksList[index].endTime))
                                                ? colors['neutral']![900]
                                                : colors['neutral']![900]!.withOpacity(0.3) ,
                                            fontFamily: 'CSEOrganizersApp',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15,
                                          ),),
                                    ),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(CSEOrganizersApp.clock,color:
                                    (DateTime.now().isAfter(
                                        currentDayTasksList[index].startTime) &&
                                        DateTime.now().isBefore(
                                            currentDayTasksList[index].endTime))
                                        ? colors['neutral']![900]
                                        : colors['neutral']![900]!.withOpacity(0.3) ,
                                    ),
                                        Text(
                                            ' ${currentDayTasksList[index].rawStartTime} - ${currentDayTasksList[index].rawEndTime}',style: TextStyle(
                                          color: (DateTime.now().isAfter(
                                              currentDayTasksList[index].startTime) &&
                                              DateTime.now().isBefore(
                                                  currentDayTasksList[index].endTime))
                                              ? colors['neutral']![900]
                                              : colors['neutral']![900]!.withOpacity(0.3) ,
                                          fontFamily: 'CSEOrganizersApp',
                                        ),)
                                      ],
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Text(
                                      currentDayTasksList[index].description,style: TextStyle(
                                    color: (DateTime.now().isAfter(
                                        currentDayTasksList[index].startTime) &&
                                        DateTime.now().isBefore(
                                            currentDayTasksList[index].endTime))
                                        ? colors['neutral']![900]
                                        : colors['neutral']![900]!.withOpacity(0.5) ,
                                    fontFamily: 'CSEOrganizersApp',
                                    fontSize: 13,
                                  ),)
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 16.0),
                                  child: Divider(
                                    color: (DateTime.now().isAfter(
                                        currentDayTasksList[index].startTime) &&
                                        DateTime.now().isBefore(
                                            currentDayTasksList[index].endTime))
                                        ? colors['neutral']![900]
                                        : colors['neutral']![900]!.withOpacity(0.5),
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
                                        shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(16.0),
                                            ),
                                        elevation: 0.0,
                                        onPressed: () {
                                          if(DateTime.now().isAfter(
                                              currentDayTasksList[index].startTime) &&
                                              DateTime.now().isBefore(
                                                  currentDayTasksList[index].endTime)){
                                            //Uncomment this when ScanPage implemented.
                                            //Navigator.of(context).push(MaterialPageRoute(builder: (_) => ScanPage()));
                                          }
                                        },
                                        color: (DateTime.now().isAfter(
                                            currentDayTasksList[index].startTime) &&
                                            DateTime.now().isBefore(
                                                currentDayTasksList[index].endTime))
                            ? colors['primary']![500]
                            : colors['primary']![500]!.withOpacity(0.7),
                                        child: Padding(
                                          padding: const EdgeInsets.all(6.0),
                                          child: Row(
                                            children: [
                                              Icon(
                                                CSEOrganizersApp.camera,
                                                  color: (DateTime.now().isAfter(
                                              currentDayTasksList[index].startTime) &&
                                              DateTime.now().isBefore(
                                                  currentDayTasksList[index].endTime))
                                            ? colors['shades']!['white']
                                            : colors['shades']!['white']!.withOpacity(0.5) ,
                                              ),
                                              SizedBox(width: screenSize.width/50,),
                                              Text(
                                                'Scan',
                                                style: TextStyle(
                                                  color: (DateTime.now().isAfter(
                                                      currentDayTasksList[index].startTime) &&
                                                      DateTime.now().isBefore(
                                                          currentDayTasksList[index].endTime))
                                                      ? colors['shades']!['white']
                                                      : colors['shades']!['white']!.withOpacity(0.7) ,
                                                  fontFamily: 'CSEOrganizersApp',
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 13,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),

                                      ),
                                      SizedBox(
                                        width: screenSize.width / 20,
                                      ),
                                      MaterialButton(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(16.0),
                                        ),
                                        elevation: 0.0,
                                        onPressed: () {
                                          if(DateTime.now().isAfter(
                                              currentDayTasksList[index].startTime) &&
                                              DateTime.now().isBefore(
                                                  currentDayTasksList[index].endTime)){
                                            Navigator.of(context).push(MaterialPageRoute(builder: (_) => const ParticipantsPage()));
                                          }
                                        },
                                        color: colors['shades']!['white'],
                                        child: Padding(
                                          padding: const EdgeInsets.all(6.0),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Participants',
                                                style: TextStyle(
                                                  color: (DateTime.now().isAfter(
                                                      currentDayTasksList[index].startTime) &&
                                                      DateTime.now().isBefore(
                                                          currentDayTasksList[index].endTime))
                                                      ? colors['shades']!['black']
                                                      : colors['shades']!['black']!.withOpacity(0.3) ,
                                                  fontFamily: 'CSEOrganizersApp',
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 13,
                                                ),
                                              ),
                                              SizedBox(width: screenSize.width/50,),
                                              Icon(
                                                CSEOrganizersApp.arrow,
                                                  color: (DateTime.now().isAfter(
                                                  currentDayTasksList[index].startTime) &&
                                                  DateTime.now().isBefore(
                                                      currentDayTasksList[index].endTime))
                                            ? colors['shades']!['black']
                                            : colors['shades']!['black']!.withOpacity(0.3) ,
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
                      padding: EdgeInsets.only(
                          top: index == 0 ? 0.0 : 16.0, bottom: 16.0,left :24.0, right : 24.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: (DateTime.now().isAfter(
                              currentDayTasksList[index].startTime) &&
                              DateTime.now().isBefore(
                                  currentDayTasksList[index].endTime))
                              ? colors['primary']![100]
                              : colors['shades']!['white'],

                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                    child:
                                    Text(currentDayTasksList[index].title,style: TextStyle(
                                      color: (DateTime.now().isAfter(
                                          currentDayTasksList[index].startTime) &&
                                          DateTime.now().isBefore(
                                              currentDayTasksList[index].endTime))
                                        ? colors['neutral']![900]
                                        : colors['neutral']![900]!.withOpacity(0.3) ,
                                      fontFamily: 'CSEOrganizersApp',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                    ),),
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(CSEOrganizersApp.clock,color:
                                      (DateTime.now().isAfter(
                                      currentDayTasksList[index].startTime) &&
                                      DateTime.now().isBefore(
                                          currentDayTasksList[index].endTime))
                                      ? colors['neutral']![900]
                                      : colors['neutral']![900]!.withOpacity(0.3),),
                                      Text(
                                          ' ${currentDayTasksList[index].rawStartTime} - ${currentDayTasksList[index].rawEndTime}'
                                        ,style: TextStyle(
                                        color: (DateTime.now().isAfter(
                                            currentDayTasksList[index].startTime) &&
                                            DateTime.now().isBefore(
                                                currentDayTasksList[index].endTime))
                                            ? colors['neutral']![900]
                                            : colors['neutral']![900]!.withOpacity(0.3) ,
                                        fontFamily: 'CSEOrganizersApp',
                                      ),),
                                    ],
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8.0),
                                child: Text(
                                    currentDayTasksList[index].description,style:
                                TextStyle(
                                  color: (DateTime.now().isAfter(
                                      currentDayTasksList[index].startTime) &&
                                      DateTime.now().isBefore(
                                          currentDayTasksList[index].endTime))
                                      ? colors['neutral']![900]
                                      : colors['neutral']![900]!.withOpacity(0.5) ,
                                  fontFamily: 'CSEOrganizersApp',
                                  fontSize: 13,
                                ),),),
                            ],
                          ),
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
