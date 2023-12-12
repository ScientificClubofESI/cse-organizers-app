import 'package:cse_organizers_app/Services/data_manager.dart';
import 'package:cse_organizers_app/constants.dart';
import 'package:cse_organizers_app/data/event_data.dart';
import 'package:cse_organizers_app/data/user_data.dart';
import 'package:cse_organizers_app/widgets/participant.dart';
import 'package:flutter/material.dart';
import 'package:cse_organizers_app/widgets/scanbutton.dart';
import 'package:cse_organizers_app/icons/c_s_e_organizers_app_icons.dart';
import 'package:cse_organizers_app/constants.dart' as constants;

// constants.colors[<name-of-color>]![<number-of-color>]

// CSEOrganizersApp.<name-of-icon>

/*class participantinfo {
  final String name;
  final String team;
  final num phonenumber;
  bool scannedbool;
  participantinfo(this.name, this.team, this.phonenumber, this.scannedbool);
}*/

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
          body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            SizedBox(
              height: screenSize.height / 40,
            ),
            Center(
              child: Container(
                // padding:  l > 600 ? EdgeInsets.symmetric(vertical: 2) : EdgeInsets.all(0),
                height: h > 600 ? h * 0.22 : h * 0.28,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      //width: l * 0.47,
                      child: Text('Participants',
                          style: TextStyle(
                              fontSize: textSize,
                              fontWeight: FontWeight.w600,
                              color: constants.colors['neutral']![900])),
                    ),
                    Center(
                      child: Container(
                        //  height: h > 600 ? h * 0.06 : h * 0.08,
                        width: l * 0.8878,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                  color: const Color.fromARGB(14, 0, 0, 0),
                                  offset: const Offset(5, 3),
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
                                  height: h > 600 ? h * 0.05 : h * 0.07,
                                  width: l < 600 ? l * 0.2910 : l * 0.2,
                                  // padding: EdgeInsets.symmetric(horizontal: item.id == 20 ? 2 : 0),
                                  decoration: BoxDecoration(
                                      color: index == item.id
                                          ? constants.colors['primary']![500]
                                          : constants
                                              .colors['background']!['light'],
                                      borderRadius: BorderRadius.circular(20)),

                                  child: Center(
                                      child: Text(
                                    item.actionstring,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
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
            SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 20, bottom: 20),
                      width: l * 0.9,
                      padding: const EdgeInsets.only(bottom: 25),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(255, 210, 227, 255),
                              blurRadius: 40,
                            )
                          ]),
                      child: Wrap(
                        children: [...participantstoappear()],
                      ),
                    ),
                    ScanButton(),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
