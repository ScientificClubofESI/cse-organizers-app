import 'package:auto_size_text/auto_size_text.dart';
import 'package:cse_organizers_app/icons/c_s_e_organizers_app_icons.dart';
import 'package:flutter/material.dart';
import 'package:cse_organizers_app/constants.dart' as constants;

class ParticipantButton extends StatelessWidget {
  final String name;
  final double deg;
  final double size;

  const ParticipantButton({
    super.key,
    required this.name,
    required this.deg,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    final double largeur = MediaQuery.of(context).size.width;
    final double hauteur = MediaQuery.of(context).size.height;

    return ElevatedButton(
      onPressed: () {},
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        AutoSizeText(name,
            style: TextStyle(
                fontSize: size, color: constants.colors['neutral']![900]),
            maxLines: 1),
        Icon(
          CSEOrganizersApp.arrow,
          size: 14,
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
