import 'package:flutter/material.dart';

class AgendaPage extends StatefulWidget {
  const AgendaPage({Key? key});

  @override
  _AgendaPageState createState() => _AgendaPageState();
}

class _AgendaPageState extends State<AgendaPage> {
  int i = 3;
  int selectedTextIndex = 0;
  int selectedIconIndex = 0;
  bool isAgendaActive = false;

  void toggleTextButtonState(int index) {
    setState(() {
      selectedTextIndex = index;
    });
  }

  void toggleIconButtonState(int index) {
    setState(() {
      selectedIconIndex = index;
      isAgendaActive = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> buttons = List.generate(i, (index) {
      return Expanded(
        flex: 1,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              color: selectedTextIndex == index
                  ? Color(0xff06A4FF)
                  : Color(0xfff5f5f5),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: InkWell(
              onTap: () {
                toggleTextButtonState(index);
              },
              child: Center(
                child: Text(
                  'Day ' + (index + 1).toString(),
                  style: TextStyle(
                    color: selectedTextIndex == index
                        ? Color(0xffffffff)
                        : Color(0xff262626),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });

    return Scaffold(
      body: Container(
        color: Color(0xffffffff),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  'Agenda',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff262626),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: buttons,
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                color: Color(0xfff5f5f5),
                child: Column(
                  children: [
                    Text(' '),
                    Center(
                      child: Text(
                        'Event Agenda',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff262626),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xff06A4FF),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          IconButton(
                            icon: selectedIconIndex == 0
                                ? (isAgendaActive
                                    ? Icon(Icons.calendar_month)
                                    : Icon(Icons.calendar_month_outlined))
                                : Icon(Icons.calendar_month_outlined),
                            onPressed: () {
                              toggleIconButtonState(0);
                            },
                            color: Colors.white,
                          ),
                          Text(
                            'Agenda',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          IconButton(
                            icon: selectedIconIndex == 1
                                ? (isAgendaActive
                                    ? Icon(Icons.check_box_rounded)
                                    : Icon(Icons.check_box_outlined))
                                : Icon(Icons.check_box_outlined),
                            onPressed: () {
                              toggleIconButtonState(1);
                            },
                            color: Colors.white,
                          ),
                          Text(
                            'Tasks',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          IconButton(
                            icon: selectedIconIndex == 2
                                ? (isAgendaActive
                                    ? Icon(Icons.search_off_sharp)
                                    : Icon(Icons.search))
                                : Icon(Icons.search),
                            onPressed: () {
                              toggleIconButtonState(2);
                            },
                            color: Colors.white,
                          ),
                          Text(
                            'Search',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
