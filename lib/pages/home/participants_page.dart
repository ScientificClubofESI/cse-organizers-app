import 'package:cse_organizers_app/Services/data_manager.dart';
import 'package:cse_organizers_app/constants.dart';
import 'package:cse_organizers_app/data/event_data.dart';
import 'package:cse_organizers_app/data/user_data.dart';
import 'package:cse_organizers_app/widgets/participant.dart';
import 'package:flutter/material.dart';
import 'package:cse_organizers_app/widgets/scanbutton.dart';
import 'package:cse_organizers_app/icons/c_s_e_organizers_app_icons.dart';
import 'package:cse_organizers_app/constants.dart' as constants;

class action {
  final num id;
  final String actionstring;
  action(this.id, this.actionstring);
}

class ParticipantPage extends StatefulWidget {
  const ParticipantPage({super.key});

  @override
  State<ParticipantPage> createState() => _ParticipantPageState();
}

class _ParticipantPageState extends State<ParticipantPage> {
  static List participants = UserData.participants;
  final List<String> daysList = []; // liste des jours
  int current = 0;
  List unscannedparticipants = [];
  List scannedparticipants = [];
  @override
  void initState() {
    super.initState();
    participants = UserData.participants;
    setState(() {
      for (var element in participants) {
        if (element.scannedbool == false) {
          unscannedparticipants.add(element);
        } else {
          scannedparticipants.add(element);
        }
      }
    });
  }

  List toggleactions = [
    action(0, 'All'),
    action(1, 'Scanned'),
    action(2, 'Unscanned')
  ];
  num index = 0;

  String inputvalue = '';
  void addscannedparticipant(item) async {
    await updateScannedParticipants(item.id, true);

    setState(() {
      item.scannedbool = true;
      scannedparticipants.add(item);
      unscannedparticipants.remove(item);
    });
  }

  void addunscannedparticipant(item) async {
    await updateScannedParticipants(item.id, false);

    setState(() {
      item.scannedbool = false;

      scannedparticipants.remove(item);
      unscannedparticipants.add(item);
    });
  }

  Iterable<Participant> participantstoappear() {
    List listtoappear = [];

    if (index == 0) {
      listtoappear = participants;
    }
    if (index == 1) {
      listtoappear = scannedparticipants;
    }
    if (index == 2) {
      listtoappear = unscannedparticipants;
    }

    return listtoappear
        .where((item) =>
            item.fullName.toLowerCase().contains(inputvalue.toLowerCase()) ||
            item.team.toLowerCase().contains(inputvalue.toLowerCase()))
        .map((item) {
      return Participant(
        fullName: item.fullName,
        team: item.team,
        phone: item.phone,
        scannedbool: item.scannedbool,
        addscannedparticipant: () {
          addscannedparticipant(item);
        },
        addunscannedparticipant: () {
          addunscannedparticipant(item);
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    double l = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    double textSize = l < 600 ? 20 : 1;
    return RefreshIndicator(
      onRefresh: () async {
        UserData.participants = [];
        await getParticipants(EventsData.eventInfo!.id);
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: colors['background']!['light'],
          body: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Center(
                child: Container(
                  // padding:  l > 600 ? EdgeInsets.symmetric(vertical: 2) : EdgeInsets.all(0),
                  height: screenSize.height * 0.25,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFFBFE),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05), // Shadow color
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset:
                            Offset(0, 5), // Positive Y value for bottom shadow
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ///"Participants"
                      Center(
                        child: Text(
                          "Participants",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: screenSize.width * 0.074,
                              fontWeight: FontWeight.w600,
                              wordSpacing: 48),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),

                      ///Search field
                      Center(
                        child: Container(
                          width: l * 0.8878,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color.fromARGB(14, 0, 0, 0),
                                    offset: Offset(5, 3),
                                    blurRadius: 15,
                                    spreadRadius: 0)
                              ]),
                          child: TextField(
                            //controller: _searchcontroller,
                            onChanged: (value) {
                              setState(() {
                                inputvalue = value;
                              });
                            },
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                // SvgPicture.string(searchinput,height: 50,width:50,)
                                prefixIcon: Icon(CSEOrganizersApp.search,
                                    color: constants.colors['neutral']![900]),
                                hintText: 'Search Participants/Teams',
                                hintStyle: TextStyle(
                                    fontSize: l > 600 ? 15 : 19,
                                    color: constants.colors['neutral']![100])),
                          ),
                        ),
                      ),

                      ///list [All,scanned,unscanned]
                      SingleChildScrollView(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ...toggleactions.map((item) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    index = item.id;
                                  });
                                },
                                child: Center(
                                  child: Container(
                                    height: screenSize.height * 0.034,
                                    width: screenSize.width * 0.271,
                                    // padding: EdgeInsets.symmetric(horizontal: item.id == 20 ? 2 : 0),
                                    decoration: BoxDecoration(
                                        color: index == item.id
                                            ? constants.colors['primary']![500]
                                            : constants
                                                .colors['background']!['light'],
                                        borderRadius:
                                            BorderRadius.circular(16)),

                                    child: Center(
                                        child: Text(
                                      item.actionstring,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontFamily: "Poppins",
                                          fontSize: 17,
                                          color: index == item.id
                                              ? Colors.white
                                              : constants
                                                  .colors['neutral']![900]),
                                    )),
                                  ),
                                ),
                              );
                            }),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),

              ///List of participants
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 20, bottom: 20),
                      width: l * 0.887,
                      padding: const EdgeInsets.only(bottom: 25),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Wrap(
                        children: [...participantstoappear()],
                      ),
                    ),
                    const ScanButton(),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
