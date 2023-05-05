import 'package:cse_organizers_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:cse_organizers_app/widgets/participants/participant_card.dart';
import 'package:cse_organizers_app/constants.dart' as constants;

class Mylist extends StatefulWidget {
   List maliste ;
   Mylist({
    super.key,
    required this.maliste,
});

  @override
  State<Mylist> createState() => _MylistState();
}

class _MylistState extends State<Mylist> {

  @override
  Widget build(BuildContext context) {
    final largeur = MediaQuery.of(context).size.width;

    return Container(
      child: ListView.builder(
        itemCount: widget.maliste.length,
        itemBuilder: (context, i) {
          return  Container(
            padding: EdgeInsets.symmetric(horizontal: largeur*0.037),
            child: Container(
                decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Color(0xFFB2E3FF), width: 1.0)),),
                child: widget.maliste[i],
            ),
          );
        },
      ),
    );
  }
}
