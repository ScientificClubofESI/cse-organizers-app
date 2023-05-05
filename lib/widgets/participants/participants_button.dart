import 'package:cse_organizers_app/widgets/participants/participants_mylist.dart';
import 'package:cse_organizers_app/widgets/participants/participant_card.dart';
import 'package:flutter/material.dart';
import 'package:cse_organizers_app/constants.dart' as constants;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cse_organizers_app/icons/c_s_e_organizers_app_icons.dart';

class ParticipantsButton extends StatefulWidget {
  String text;
  int i;
   void Function() fct;
   ParticipantsButton({
    super.key,
    required this.text,
    required this.fct,
     required this.i,
});

  @override
  State<ParticipantsButton> createState() => _ParticipantsButtonState();
}

class _ParticipantsButtonState extends State<ParticipantsButton> {
  int selectedButtonIndex = 0;

  @override
  Widget build(BuildContext context) {
    var v = -1;
    final largeur = MediaQuery.of(context).size.width;
    final hauteur = MediaQuery.of(context).size.height;
    return ElevatedButton(
      onPressed: () {
        widget.fct();
        setState(() {
          switch(widget.i) {
            case 0:
              selectedButtonIndex = widget.i;
              break;
            case 1:
              selectedButtonIndex = widget.i;
              break;
            case 2:
              selectedButtonIndex = widget.i;
              break;
          }
        });
      },      style: ElevatedButton.styleFrom(
          elevation: 0.0,
          fixedSize: Size(largeur * 0.27, hauteur*0.034),
          backgroundColor: selectedButtonIndex == widget.i ? constants.colors['primary']![500] : constants.colors['background']!['light'],
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: largeur * 0.01, vertical: largeur * 0.0039),
        child: AutoSizeText(widget.text, style: TextStyle(fontSize: 16, color: selectedButtonIndex == widget.i ? constants.colors['background']!['light'] : constants.colors['neutral']![900],), maxLines: 1),
      ),
    );
  }
}
