import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cse_organizers_app/icons/c_s_e_organizers_app_icons.dart';
import 'package:cse_organizers_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Organizer {
  final String id, fullName, phone, task;
  final bool bollea;

  Organizer({
    required this.id,
    required this.fullName,
    required this.phone,
    required this.task,
    required this.bollea,
  });
}

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int current = 0;

  List<String> items = ["All", "Free", "Occupied"];

  List<Organizer> list = [
    Organizer(
        id: '1',
        fullName: 'nohamed1',
        phone: '0555411700',
        task: 'task1',
        bollea: true),
    Organizer(
        id: '1',
        fullName: 'johamed5',
        phone: '0555411700',
        task: 'task',
        bollea: false),
    Organizer(
        id: '1',
        fullName: 'hohamed2',
        phone: '0555411700',
        task: 'task2',
        bollea: true),
    Organizer(
        id: '1',
        fullName: 'mohamed4',
        phone: '0555411700',
        task: 'task4',
        bollea: true),
    Organizer(
        id: '1',
        fullName: 'mohamed3',
        phone: '0555411700',
        task: 'task',
        bollea: false),
    Organizer(
        id: '1',
        fullName: 'mohamed6',
        phone: '0555411700',
        task: 'task6',
        bollea: true),
  ];
  late List<List<Organizer>> page = <List<Organizer>>[];
  late List<Organizer> organzerList = page[current];
  List<Organizer> freeTask = [];
  List<Organizer> occTask = [];
  List<Organizer> findList = [];

  @override
  void initState() {
    // TODO: implement initState
    page.add(list);
    freeTask = list.where((element) => element.bollea == false).toList();
    occTask = list.where((element) => element.bollea == true).toList();
    page.add(freeTask);
    page.add(occTask);
    findList = organzerList;
    super.initState();
  }

  void runFilter(String word) {
    List<Organizer> result = [];
    if (word.isEmpty) {
      result = organzerList;
    } else {
      result = organzerList
          .where((element) =>
              element.fullName.toLowerCase().contains(word.toLowerCase()) ||
              element.task.toLowerCase().contains(word.toLowerCase()))
          .toList();
    }
    setState(() {
      findList = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: colors['background']!['light'],
        body: Column(
          children: [
            Container(
              height: screenSize.height / 3.2,
              color: Color(0xFFF5F6F7),
              child: Column(
                children: [
                  SizedBox(
                    height: screenSize.height / 16,
                  ),
                  Center(
                    child: Text(
                      "Search",
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                          wordSpacing: 48),
                    ),
                  ),
                  SizedBox(
                    height: screenSize.height / 30,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: TextField(
                      onChanged: (value) => runFilter(value),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Search Orgnise",
                        prefixIcon: Icon(CSEOrganizersApp.search),
                        prefixIconColor: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenSize.height / 30,
                  ),
                  Container(
                    height: screenSize.height / 20,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Center(
                      child: ListView.builder(
                          itemCount: items.length,
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  current = index;
                                  organzerList = page[index];
                                  findList = organzerList;
                                });
                              },
                              child: AnimatedContainer(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                margin: EdgeInsets.symmetric(horizontal: 11),
                                duration: Duration(milliseconds: 300),
                                width: screenSize.width / 4,
                                height: screenSize.height / 20,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16.0),
                                    color: current == index
                                        ? Colors.blue
                                        : Colors.white),
                                child: Center(
                                  child: Text(
                                    items[index],
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 27, vertical: 10),
                    itemCount: findList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                                20.0), // Adjust the radius as needed
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: screenSize.height / 100,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: screenSize.width / 60,
                                  ),
                                  Icon(CSEOrganizersApp.userIcon, size: 28),
                                  SizedBox(
                                    width: screenSize.width / 60,
                                  ),
                                  Text(
                                    "${findList[index].fullName}",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    width: screenSize.width / 20,
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 5),
                                    decoration: BoxDecoration(
                                      color: findList[index].bollea == false
                                          ? Colors.green[200]
                                          : Colors.red[200],
                                      borderRadius: BorderRadius.circular(16.0),
                                      // Adjust the radius as needed
                                    ),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: screenSize.width / 50,
                                        ),
                                        Icon(
                                          Icons.circle,
                                          color: findList[index].bollea == false
                                              ? Colors.green[500]
                                              : Colors.red[500],
                                          size: 20,
                                        ),
                                        SizedBox(
                                          width: screenSize.width / 40,
                                        ),
                                        Text(
                                          findList[index].bollea == false
                                              ? "Free"
                                              : "Occupied",
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        SizedBox(
                                          width: screenSize.width / 50,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: screenSize.height / 100,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: screenSize.width / 60,
                                  ),
                                  Icon(
                                    CSEOrganizersApp.phone,
                                    size: 28,
                                  ),
                                  SizedBox(
                                    width: screenSize.width / 60,
                                  ),
                                  Text("${findList[index].phone}",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600))
                                ],
                              ),
                              SizedBox(
                                height: screenSize.height / 100,
                              ),
                              findList[index].bollea == true
                                  ? Row(
                                      children: [
                                        SizedBox(
                                          width: screenSize.width / 60,
                                        ),
                                        Icon(
                                          CSEOrganizersApp.tasksActive,
                                          size: 28,
                                        ),
                                        SizedBox(
                                          width: screenSize.width / 60,
                                        ),
                                        Text("${findList[index].task}",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600))
                                      ],
                                    )
                                  : SizedBox(
                                      height: 0,
                                    ),
                              SizedBox(
                                height: screenSize.height / 100,
                              ),
                            ],
                          ),
                        ),
                      );
                    }))
          ],
        ));
  }
}
