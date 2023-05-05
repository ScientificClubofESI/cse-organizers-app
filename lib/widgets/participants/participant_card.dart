import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:cse_organizers_app/constants.dart' as constants;
import 'package:cse_organizers_app/icons/c_s_e_organizers_app_icons.dart';

class ParticipantCard extends StatefulWidget {
  final String participant_name;
  final String participant_number;
  final String participant_team;
  bool scanned;
  ParticipantCard({
    super.key,
    required this.participant_name,
    required this.participant_number,
    required this.participant_team,
    required this.scanned,
  });

  @override
  State<ParticipantCard> createState() => _ParticipantCardState();
}

class _ParticipantCardState extends State<ParticipantCard> {
  @override
  Widget build(BuildContext context) {
    final largeur = MediaQuery.of(context).size.width;
    final hauteur = MediaQuery.of(context).size.height;

    return Container(
      width: largeur * 0.81,
      height: largeur * 0.289,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: Colors.white),
      padding: EdgeInsets.symmetric(
          horizontal: largeur * 0.03738, vertical: hauteur * 0.01),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: largeur * 0.6,
                child: AutoSizeText(
                  widget.participant_name,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'CSEOrganizersApp',
                      color: constants.colors['neutral']![900]),
                  maxLines: 1,
                ),
              ),
              Container(
                width: largeur * 0.6,
                child: AutoSizeText(
                  widget.participant_team,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      fontFamily: 'CSEOrganizersApp',
                      color: constants.colors['neutral']![200]),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: hauteur * 0.01),
                child: Row(
                  children: [
                    Icon(
                      CSEOrganizersApp.phoneOutlined,
                      size: largeur * 0.058,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: largeur * 0.01),
                      child: AutoSizeText(
                        widget.participant_number,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'CSEOrganizersApp',
                            color: constants.colors['neutral']![900]),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          widget.scanned
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      widget.scanned = !widget.scanned;
                      setState(() {});
                    });
                  },
                  //test test
                  icon: const Icon(
                    CSEOrganizersApp.checkbox,
                    size: 48,
                    color: Color(0xFF06A4FF),
                  ),
                )
              : IconButton(
                  onPressed: () {
                    setState(
                      () {
                        widget.scanned = !widget.scanned;
                        setState(() {});
                      },
                    );
                  },
                  icon: const Icon(
                    CSEOrganizersApp.checkboxChecked,
                    size: 48,
                    color: Color(0xFF06A4FF),
                  ),
                )
        ],
      ),
    );
  }
}
