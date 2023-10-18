import 'package:cse_organizers_app/widgets/participant.dart';
import 'package:flutter/material.dart';
import 'package:cse_organizers_app/widgets/scanbutton.dart';
import 'package:cse_organizers_app/icons/c_s_e_organizers_app_icons.dart';
import 'package:cse_organizers_app/constants.dart' as constants;

// constants.colors[<name-of-color>]![<number-of-color>]

// CSEOrganizersApp.<name-of-icon>

class participantinfo {
  final String name;
  final String team;
  final num phonenumber;
  bool scannedbool;
  participantinfo(this.name, this.team, this.phonenumber, this.scannedbool);
}

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
  List participants = [
    participantinfo('Amine Kadoum', 'Team1', 0123456789, false),
    participantinfo('Nada Djedjig', 'Team2', 017856789, false),
    participantinfo('Ayoub Kasmi', 'Team3', 0126956789, false),
    participantinfo('Issam Boussebata', 'Team4', 01274416789, false),
    participantinfo('Yasmine Zaidi', 'Team5', 0124586789, false),
    participantinfo('Amine Guerraiche', 'Team6', 012526789, false),
    participantinfo('Selmane Mamchaoui', 'Team7', 012345122, false),
  ];

  List unscannedparticipants = [];
  List scannedparticipants = [];
  @override
  void initState() {
    super.initState();
    setState(() {
      unscannedparticipants = [...participants];
    });
  }

  List toggleactions = [
    action(0, 'All'),
    action(1, 'Scanned'),
    action(2, 'Unscanned')
  ];
  num index = 0;

  String inputvalue = '';
  void addscannedparticipant(item) {
    setState(() {
      item.scannedbool = true;
      scannedparticipants.add(item);
      unscannedparticipants.remove(item);
    });
  }

  void addunscannedparticipant(item) {
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
    item.name.toLowerCase().contains(inputvalue.toLowerCase()) ||
        item.team.toLowerCase().contains(inputvalue.toLowerCase()))
        .map((item) {
      return Participant(
        name: item.name,
        team: item.team,
        phonenumber: item.phonenumber,
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
    double l = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    double textSize = l < 600 ? 25 : 20;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: h > 600 ? h * 0.25 : h * 0.3,
        elevation: 5,
        shadowColor: Colors.black45,
        // ignore: sized_box_for_whitespace
        title: Container(
          padding:
          l > 600 ? EdgeInsets.symmetric(vertical: 2) : EdgeInsets.all(0),
          height: h > 600 ? h * 0.22 : h * 0.28,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.center,
                width: l * 0.47,
                child: Text('Participants',
                    style: TextStyle(
                        fontSize: textSize,
                        fontWeight: FontWeight.w600,
                        color: constants.colors['neutral']![900])),
              ),
              Container(
                height: h > 600 ? h * 0.06 : h * 0.08,
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
                  // controller: _searchcontroller,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ...toggleactions.map((item) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          index = item.id;
                        });
                      },
                      child: Container(
                        height: h > 600 ? h * 0.05 : h * 0.07,
                        width: l < 600 ? l * 0.2910 : l * 0.2,
                        // padding: EdgeInsets.symmetric(horizontal: item.id == 20 ? 2 : 0),
                        decoration: BoxDecoration(
                            color: index == item.id
                                ? constants.colors['primary']![500]
                                : constants.colors['background']!['light'],
                            borderRadius: BorderRadius.circular(20)),

                        child: Center(
                            child: Text(
                              item.actionstring,
                              style: TextStyle(
                                  fontSize: 17,
                                  color: index == item.id
                                      ? Colors.white
                                      : constants.colors['neutral']![900]),
                            )),
                      ),
                    );
                  }),
                ],
              )
            ],
          ),
        ),
        // title: Title(color: Colors.black, child: Text('Participants',style: TextStyle(fontSize: 40,fontWeight: FontWeight.w500),)),
      ),
      body: SingleChildScrollView(
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
              const ScanButton()
            ],
          ),
        ),
      ),
    );
  }
}