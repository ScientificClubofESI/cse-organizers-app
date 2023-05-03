import 'package:auto_size_text/auto_size_text.dart';
import 'package:cse_organizers_app/icons/c_s_e_organizers_app_icons.dart';
import 'package:cse_organizers_app/pages/home/tasks/participants_page.dart';
import 'package:flutter/material.dart';
import 'package:cse_organizers_app/constants.dart' as constants;

class ParticipantButton extends StatelessWidget {
  final String name;
  final double deg;

  const ParticipantButton({
    super.key,
    required this.name,
    required this.deg,
  });

  @override
  Widget build(BuildContext context) {
    final double largeur = MediaQuery.of(context).size.width;
    final double hauteur = MediaQuery.of(context).size.height;

    return ElevatedButton(
      onPressed: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => ParticipantsPage()));
      },
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Container(
          width: largeur * 0.25,
          child: AutoSizeText(name,
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: "CSEOrganizersApp",
                  color: constants.colors['neutral']![900]),
              maxLines: 1),
        ),
        Icon(
          CSEOrganizersApp.arrow,
          size: largeur * 0.05,
          color: constants.colors['neutral']![900],
        ),
      ]),
      style: ElevatedButton.styleFrom(
        backgroundColor: constants.colors['shades']!['white'],
        fixedSize: Size(largeur * 0.47, hauteur * 0.07),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(deg),
        ),
        elevation: 0,
      ),
    );
  }
}
