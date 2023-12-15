import 'package:cse_organizers_app/Services/data_manager.dart';
import 'package:cse_organizers_app/constants.dart';
import 'package:cse_organizers_app/data/event_data.dart';
import 'package:cse_organizers_app/data/user_data.dart';
import 'package:flutter/material.dart';

class AgendaPage extends StatefulWidget {
  const AgendaPage({Key? key});

  @override
  _AgendaPageState createState() => _AgendaPageState();
}

class _AgendaPageState extends State<AgendaPage> {
  int current = 0;
  int eventDAYS = EventsData.events[0].days.length;
  final List<String> daysList = []; // liste des jours

  String currentDayList = ' ';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentDayList = EventsData.agenda[0];
    //initialiser le nombre de jours
    for (var i = 1; i <= eventDAYS; i++) {
      daysList.add("DAY $i");
    }

    // initialisé la liste du 1er jour
    // currentDayList.add(agenda[0]);
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return RefreshIndicator(
      onRefresh: () async {
        //je recupere la liste des photos
        currentDayList = EventsData.agenda[current];
        setState(() {
          // currentDayTasksList = UserData.tasks;
        });
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: colors['background']!['light'],
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              /// "Agenda" & days list
              Container(
                height: screenSize.height*0.19,
                decoration: BoxDecoration(
                  color: colors['shades']!['white'],
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05), // Shadow color
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: Offset(0, 5), // Positive Y value for bottom shadow
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ///"Agenda"
                    Container(
                      alignment: Alignment.topCenter,
                      child: Text(
                        'Agenda',
                        style: TextStyle(
                          color: colors['neutral']![900],
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w900,
                          fontSize: screenSize.width*0.074,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),

                    ///Days list
                    Container(
                      width: double.infinity,
                      height: 70,
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Center(
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: eventDAYS,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  current = index;
                                  currentDayList = EventsData.agenda[index];
                                });
                              },
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                height: screenSize.height*0.06,
                                width: screenSize.width*0.27,
                                margin: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: current == index
                                      ? colors['primary']![500]
                                      : colors['background']!['light'],
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(0.0),
                                    child: Text(
                                      daysList[index],
                                      // event.days[index],
                                      style: TextStyle(
                                        color: (current == index)
                                            ? colors['shades']!['white']
                                            : colors['neutral']![900],
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        fontSize: screenSize.height*0.021,
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
              /// "Event Agenda" + agenda image
              SizedBox(
                height: screenSize.height*0.034,
              ),
              Column(
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Event Agenda',
                    style: TextStyle(
                      color: colors['neutral']![900],
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: screenSize.width*0.074,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox( height: screenSize.height*0.04,),
                  ///Agenda Image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      //je recupere limage de ma base de donnée
                      '${currentDayList}',
                      width: screenSize.width / 1.3,
                      height: screenSize.height / 2,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*class _AgendaPageState extends State<AgendaPage> {
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
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              color: selectedTextIndex == index
                  ? const Color(0xff06A4FF)
                  : const Color(0xfff5f5f5),
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
                        ? const Color(0xffffffff)
                        : const Color(0xff262626),
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
        color: const Color(0xffffffff),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Expanded(
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
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: buttons,
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                color: const Color(0xfff5f5f5),
                child: const Column(
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
          ],
        ),
      ),
    );
  }
}*/
