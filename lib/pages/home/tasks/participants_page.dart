import 'package:cse_organizers_app/widgets/participants/participants_mylist.dart';
import 'package:cse_organizers_app/widgets/participants/participants_button.dart';
import 'package:cse_organizers_app/widgets/participants/participant_card.dart';
import 'package:flutter/material.dart';
import 'package:cse_organizers_app/constants.dart' as constants;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cse_organizers_app/icons/c_s_e_organizers_app_icons.dart';

class ParticipantsPage extends StatefulWidget {
  const ParticipantsPage({super.key});

  @override
  State<ParticipantsPage> createState() => _ParticipantsPageState();
}

class _ParticipantsPageState extends State<ParticipantsPage> {
  List<ParticipantCard> listParticipants = [];
  List<ParticipantCard> actualList = [];
  List<ParticipantCard> searchlist = [];

  @override
  void initState() {
    listParticipants = [
      ParticipantCard(
          participant_name: 'BOUSSEBATA Issam',
          participant_number: '0552595654',
          participant_team: 'DEV TEAM',
          scanned: false),
      ParticipantCard(
          participant_name: 'ZAIDI Yasmine',
          participant_number: '0665949778',
          participant_team: 'TEST TEAM',
          scanned: false),
      ParticipantCard(
          participant_name: 'ABDELKADER',
          participant_number: '0778569874',
          participant_team: 'BOT TEAM',
          scanned: false),
      ParticipantCard(
          participant_name: 'MOHAMED Alaadin',
          participant_number: '0558968574',
          participant_team: 'RELEV TEAM',
          scanned: false),
      ParticipantCard(
          participant_name: 'YOUCEF Karima',
          participant_number: '0712345678',
          participant_team: 'UI/UX TEAM',
          scanned: false),
      ParticipantCard(
          participant_name: 'SMAILI Salah',
          participant_number: '0550191319',
          participant_team: 'MACHI TEAM',
          scanned: false),
      ParticipantCard(
          participant_name: 'SALAH Abderahim',
          participant_number: '0550191319',
          participant_team: 'MACHI TEAM',
          scanned: false),
      ParticipantCard(
          participant_name: 'ISLAM EDIN ABDELKADER Salah',
          participant_number: '0550191319',
          participant_team: 'MACHI TEAM',
          scanned: false),
    ];
    actualList = List.from(listParticipants);
    searchlist = List.from(actualList);
    super.initState();
  }

  void recherche(String cara) {
    setState(() {
      searchlist = actualList
          .where((element) => element.participant_name
              .toLowerCase()
              .contains(cara.toLowerCase()))
          .toList();
    });
  }

  // @TODO: Fix state management for active button

  void scanned() {
    setState(() {
      actualList = listParticipants
          .where((element) => element.scanned == false)
          .toList();
      searchlist = List.from(actualList);
    });
  }

  void unscanned() {
    setState(() {
      actualList =
          listParticipants.where((element) => element.scanned == true).toList();
      searchlist = List.from(actualList);
    });
  }

  void all() {
    setState(() {
      actualList = listParticipants
          .where(
              (element) => element.scanned == true || element.scanned == false)
          .toList();
      searchlist = List.from(actualList);
    });
  }

  @override
  Widget build(BuildContext context) {
    int i = 0, k = 0, j = 2;
    final largeur = MediaQuery.of(context).size.width;
    final hauteur = MediaQuery.of(context).size.height;
    TextEditingController _recherchecontoller = TextEditingController();

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: hauteur * 0.21,
              color: Colors.white,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: largeur * 0.056,
                      right: largeur * 0.056,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            width: largeur * 0.46,
                            child: const AutoSizeText('Participants',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 32,
                                  fontFamily: 'CSEOrganizersApp',
                                ),
                                maxLines: 1)),
                        SizedBox(height: hauteur * 0.015),
                        SizedBox(
                          height: hauteur * 0.06,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: const [
                                  BoxShadow(
                                      blurRadius: 20,
                                      color: Color.fromRGBO(214, 215, 216, 0.3))
                                ]),
                            child: TextField(
                                onChanged: (value) => recherche(value),
                                // controller: _recherchecontoller,
                                obscureText: false,
                                decoration: InputDecoration(
                                    prefixIcon:
                                        const Icon(CSEOrganizersApp.search),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xffffffff)),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xffffffff)),
                                    ),
                                    fillColor: Color(0xffffffff),
                                    filled: true,
                                    hintText: 'Search Participants/Teams',
                                    hintStyle: TextStyle(
                                        color:
                                            constants.colors['neutral']![100],
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'CSEOrganizersApp',
                                        fontSize: largeur * 0.042))),
                          ),
                        ),
                        SizedBox(height: hauteur * 0.015),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ParticipantsButton(
                              text: 'all',
                              fct: all,
                              i: 0,
                            ),
                            ParticipantsButton(
                              text: 'Scanned',
                              fct: scanned,
                              i: 1,
                            ),
                            ParticipantsButton(
                              text: 'Unscanned',
                              fct: unscanned,
                              i: 2,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: hauteur * 0.6667,
              width: largeur,
              color: constants.colors['background']!['light'],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: hauteur * 0.01),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.white),
                      width: largeur * 0.89,
                      height: hauteur * 0.55,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Mylist(maliste: searchlist),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: largeur * 0.11,
                        right: largeur * 0.11,
                        bottom: hauteur * 0.0065,
                        top: hauteur * 0.0065),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        elevation: 0.0,
                        fixedSize: Size(largeur * 0.785, hauteur * 0.07),
                        backgroundColor: constants.colors['secondary']![500],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            CSEOrganizersApp.camera,
                            size: largeur * 0.058,
                          ),
                          SizedBox(width: largeur * 0.015),
                          const AutoSizeText('Scan',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                fontFamily: 'CSEOrganizersApp',
                              )),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
