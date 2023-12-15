// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:cse_organizers_app/icons/c_s_e_organizers_app_icons.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cse_organizers_app/constants.dart' as constants;

class Participant extends StatefulWidget {
  Participant(
      {super.key,
      required this.fullName,
      required this.team,
      required this.phone,
      required this.scannedbool,
      required this.addscannedparticipant,
      required this.addunscannedparticipant});

  final String fullName;
  final String team;
  final String phone;
  final bool scannedbool;
  final VoidCallback addscannedparticipant;
  final VoidCallback addunscannedparticipant;

  @override
  State<Participant> createState() => _ParticipantState();
}

class _ParticipantState extends State<Participant> {
  // bool toggleicon = false;
  @override
  Widget build(BuildContext context) {
    double l = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Container(
      height: h > 600 ? h * 0.143 : h * 0.3,
      width: l * 0.8130,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: Color.fromARGB(136, 62, 168, 255), width: 0.7))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 200,
                height: 30,
                child: AutoSizeText(
                  widget.fullName,
                  maxLines: 2,
                  style: TextStyle(
                    fontFamily: "Poppins",
                      color: constants.colors['neutral']![900],
                      fontSize: 22,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Text(
                '(${widget.team}) ',
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 18,
                    color: constants.colors['neutral']![200],
                    fontWeight: FontWeight.w400),
              ),
              Container(
                margin: const EdgeInsets.only(top: 8),
                child: Row(
                  children: [
                    Icon(CSEOrganizersApp.phoneOutlined),
                    Text(
                      '${widget.phone}',
                      style: TextStyle(
                          fontFamily: "Poppins",

                          color: constants.colors['neutral']![900],
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
                    )
                  ],
                ),
              )
            ],
          ),
          IconButton(
              onPressed: () {
                // setState(() {
                //   widget.scannedbool = !widget.scannedbool;
                // });
                setState(() {
                  widget.scannedbool == false
                      ? widget.addscannedparticipant()
                      : widget.addunscannedparticipant();
                });
              },
              icon: widget.scannedbool == false
                  ? Icon(
                      CSEOrganizersApp.checkbox,
                      color: constants.colors['primary']![500],
                      size: l < 600
                          ? l * 0.1121
                          : l > 800
                              ? l * 0.03
                              : l * 0.07,
                    )
                  : Icon(
                      CSEOrganizersApp.checkboxChecked,
                      color: constants.colors['primary']![500],
                      size: l < 600
                          ? l * 0.1121
                          : l > 800
                              ? l * 0.03
                              : l * 0.07,
                    ))
        ],
      ),
    );
  }
}
