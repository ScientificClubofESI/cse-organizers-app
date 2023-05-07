import 'package:cse_organizers_app/models/organizer.dart';
import 'package:flutter/material.dart';
import 'package:cse_organizers_app/widgets/search/tab_button.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  //MAIN LIST OF ORGNIZERS
  List<Organizer> mainList = [];

  List<Organizer> currentList = [];

  //List of Searched orgniers ( Display List )
  List<Organizer> displayList = [];

  @override
  void initState() {
    mainList = [
      // Organizer("Ahmed ", "0699780280", true, "Task name"),
      // Organizer("Amine ", "0699780280", false, "Task name"),
      // Organizer("Rami ", "0699780280", true, "Task name"),
      // Organizer("Nasim ", "0699780280", true, "Task name"),
      // Organizer("Wisal ", "0699780280", false, "Task name"),
      // Organizer("Alaa ", "0699780280", false, "Task name"),
      // Organizer("Ayoub ", "0699780280", true, "Task name"),
      // Organizer("Ilham ", "0699780280", false, "Task name"),
      // Organizer("Lorem Ipsum ", "0699780280", true, "Task name"),
      // Organizer("Lorem Ipsum ", "0699780280", false, "Task name"),
      // Organizer("Lorem Ipsum ", "0699780280", true, "Task name"),
    ];
    currentList = List.from(mainList);
    displayList = List.from(currentList);
    super.initState();
  }

  void organizer(String val) {
    setState(() {
      displayList = mainList
          .where((element) =>
              element.fullName.toLowerCase().contains(val.toLowerCase()))
          .toList();
    });
  }

  Widget organizerTemp(Organizer org) {
    return Card(
      margin: const EdgeInsets.fromLTRB(30, 10, 30, 5),
      child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
          child: Column(
            children: [
              Row(
                children: [
                  const Icon(Icons.person),
                  const Text(
                    'Name : ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(org.fullName),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.phone),
                  const Text(
                    'Phone : ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(org.phone),
                ],
              ),
            ],
          )),
    );
  }

  //List<Card> Model = DisplayList.map((org) => organizerTemp(org)).toList();

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: const Color(0x00b2e3ff),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: const Text(
            'Search ',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
          ),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(200),
            child: Column(
              children: [
                const SizedBox(height: 20),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextField(
                    onChanged: (val) => organizer(val),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white54,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: const Icon(Icons.search),
                        prefixIconColor: Colors.greenAccent,
                        hintText: "Search orgnizer"),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const TabButton(
                      title: 'All',
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                    const TabButton(
                      title: 'Free',
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                    const TabButton(
                      title: 'Occupied',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        body: Container(
          color: Colors.white70,
          child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: displayList.length,
                    itemBuilder: (context, index) =>
                        organizerTemp(displayList[index]),
                  ),
                )
              ]),
        ));
  }
}
