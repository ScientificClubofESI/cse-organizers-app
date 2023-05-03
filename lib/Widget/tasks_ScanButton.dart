import 'package:cse_organizers_app/constants.dart';
import 'package:cse_organizers_app/icons/c_s_e_organizers_app_icons.dart';
import 'package:cse_organizers_app/pages/home/agenda_page.dart';
import 'package:cse_organizers_app/pages/home_page.dart';
import "package:flutter/material.dart";
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cse_organizers_app/constants.dart' as constants;

class ScanButton extends StatelessWidget {
  final String name;
  final double deg;

  const ScanButton({
    super.key,
    required this.name,
    required this.deg,
  });

  @override
  Widget build(BuildContext context) {
    final largeur = MediaQuery.of(context).size.width;
    final hauteur = MediaQuery.of(context).size.height;
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: constants.colors['primary']![500],
        fixedSize: Size(largeur * 0.33, hauteur * 0.07),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(deg),
        ),
        elevation: 0,
      ),
      onPressed: () {
        /*  Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) =>q_r_page())); */
      },
      label: AutoSizeText(name,
          style: TextStyle(fontSize: 18, fontFamily: "CSEOrganizersApp"),
          maxLines: 1),
      icon: Icon(CSEOrganizersApp.camera, size: largeur * 0.05),
    );
  }
}
