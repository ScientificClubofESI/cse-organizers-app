// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:cse_organizers_app/icons/c_s_e_organizers_app_icons.dart';
import 'package:cse_organizers_app/constants.dart' as constants;

class ScanButton extends StatelessWidget {
  const ScanButton({super.key});

  @override
  Widget build(BuildContext context) {
    double l = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return GestureDetector(
      child: Container(
        width: l * 0.819,
        height: h >600 ? h * 0.07 : h*0.15,
        decoration: BoxDecoration(
            color: constants.colors['secondary']![500], borderRadius: BorderRadius.circular(15)),
        margin: const EdgeInsets.only(bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                margin: EdgeInsets.only(right: 5),
                child: Icon(
                  CSEOrganizersApp.camera,
                  color: Colors.white,
                )),
            const Text(
              'Scan',
              style: TextStyle(
                  color: Colors.white,
                  // fontFamily: 'CSEOrganizersApp',
                  fontSize: 30,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
