import 'package:flutter/material.dart';

class AgendaPage extends StatefulWidget {
  const AgendaPage({Key? key});

  @override
  _AgendaPageState createState() => _AgendaPageState();
}

class _AgendaPageState extends State<AgendaPage> {
  int i = 3;
  int selectedTextIndex = 0;
  int selectedIconIndex = 0;
  bool isAgendaActive = false;

  void toggleTextButtonState(int index) {
    setState(() {
      selectedTextIndex = index;
    });
  }

  void toggleIconButtonState(int index) {
    setState(() {
      selectedIconIndex = index;
      isAgendaActive = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> buttons = List.generate(i, (index) {
      return Expanded(
        flex: 1,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              color: selectedTextIndex == index
                  ? const Color(0xff06A4FF)
                  : const Color(0xfff5f5f5),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: InkWell(
              onTap: () {
                toggleTextButtonState(index);
              },
              child: Center(
                child: Text(
                  'Day ' + (index + 1).toString(),
                  style: TextStyle(
                    color: selectedTextIndex == index
                        ? const Color(0xffffffff)
                        : const Color(0xff262626),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });

    return Scaffold(
      body: Container(
        color: const Color(0xffffffff),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  'Agenda',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff262626),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: buttons,
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                color: const Color(0xfff5f5f5),
                child: const Column(
                  children: [
                    Text(' '),
                    Center(
                      child: Text(
                        'Event Agenda',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff262626),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}