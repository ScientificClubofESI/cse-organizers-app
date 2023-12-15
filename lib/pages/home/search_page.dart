import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cse_organizers_app/Services/data_manager.dart';
import 'package:cse_organizers_app/data/user_data.dart';
import 'package:cse_organizers_app/icons/c_s_e_organizers_app_icons.dart';
import 'package:cse_organizers_app/constants.dart';
import 'package:cse_organizers_app/models/organizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int current = 0;

  List<String> items = ["All", "Free", "Occupied"];

  late List<List<Organizer>> page = <List<Organizer>>[];
  late List<Organizer> organzerList = page[current];
  List<Organizer> freeTask = [];
  List<Organizer> occTask = [];
  List<Organizer> findList = [];

  @override
  void initState() {
    // TODO: implement initState
    page.add(UserData.organizers);
    freeTask =
        UserData.organizers.where((element) => element.free != false).toList();
    occTask =
        UserData.organizers.where((element) => element.free != true).toList();
    page.add(freeTask);
    page.add(occTask);
    findList = organzerList;
    super.initState();
  }

  void runFilter(String word) {
    List<Organizer> result = [];
    if (word.isEmpty) {
      result = organzerList;
    } else {
      result = organzerList
          .where((element) =>
              element.fullName.toLowerCase().contains(word.toLowerCase()))
          .toList();
    }
    setState(() {
      findList = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return RefreshIndicator(
      onRefresh: () async {
        UserData.organizers.clear();
        await getOrganizers();
      },
      child: Scaffold(
          backgroundColor: colors['background']!['light'],
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              /// "search"+ search field + list [all, occ ...]
              Container(
                height: screenSize.height*0.3,
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F6F7),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05), // Shadow color
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: Offset(0, 5), // Positive Y value for bottom shadow
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: screenSize.height*0.01,
                    ),

                    ///"Search"
                     Center(
                      child: Text(
                        "Search",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: screenSize.width*0.074,
                            fontWeight: FontWeight.w600,
                            wordSpacing: 48),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),

                    ///Search field
                    Container(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: TextField(
                        onChanged: (value) => runFilter(value),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Search Orgniser",
                          prefixIcon: const Icon(CSEOrganizersApp.search),
                          prefixIconColor: Colors.black,
                        ),
                      ),
                    ),

                    ///list [All,Free,Occupied]
                    Container(
                      height: screenSize.height*0.034,
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Center(
                        child: ListView.builder(
                            itemCount: items.length,
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    current = index;
                                    organzerList = page[index];
                                    findList = organzerList;
                                  });
                                },
                                child: AnimatedContainer(
                                  padding: const EdgeInsets.symmetric(horizontal: 8),
                                  margin: const EdgeInsets.symmetric(horizontal: 11),
                                  duration: const Duration(milliseconds: 300),
                                  width: screenSize.width / 4,
                                  height: screenSize.height / 20,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16.0),
                                      color: current == index
                                          ? Colors.blue
                                          : Colors.white),
                                  child: SizedBox(
                                    width: screenSize.width*0.271,
                                    child: Center(
                                      child: Text(
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        items[index],
                                        style: const TextStyle(
                                            //  color: (current == index) ? Colors.blue : Colors.white,,
                                            fontFamily: 'Poppins',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: ListView.builder(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 27, vertical: 10),
                      itemCount: findList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 0, vertical: 10),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                  20.0), // Adjust the radius as needed
                            ),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: screenSize.height / 100,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    /* SizedBox(
                                      width: screenSize.width / 60,
                                    ),*/
                                    const Icon(CSEOrganizersApp.userIcon,
                                        size: 28),
                                    /*  SizedBox(
                                      width: screenSize.width / 60,
                                    ),*/
                                    SizedBox(
                                      width: screenSize.width / 2.5,
                                      child: Text(
                                        "${findList[index].fullName}",
                                        style: const TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    /*  SizedBox(
                                      width: screenSize.width / 20,
                                    ),*/
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 5),
                                      decoration: BoxDecoration(
                                        color: findList[index].free != false
                                            ? Colors.green[200]
                                            : Colors.red[200],
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                        // Adjust the radius as needed
                                      ),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: screenSize.width / 50,
                                          ),
                                          Icon(
                                            Icons.circle,
                                            color: findList[index].free != false
                                                ? Colors.green[500]
                                                : Colors.red[500],
                                            size: 16,
                                          ),
                                          SizedBox(
                                            width: screenSize.width / 40,
                                          ),
                                          SizedBox(
                                            width: screenSize.width / 6,
                                            child: Text(
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              findList[index].free == true
                                                  ? "Free"
                                                  : "Occupied",
                                              style: const TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                          SizedBox(
                                            width: screenSize.width / 50,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: screenSize.height / 100,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: screenSize.width / 60,
                                    ),
                                    const Icon(
                                      CSEOrganizersApp.phone,
                                      size: 28,
                                    ),
                                    SizedBox(
                                      width: screenSize.width / 60,
                                    ),
                                    SizedBox(
                                      width: screenSize.width / 1.6,
                                      child: Text("${findList[index].phone}",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400)),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: screenSize.height / 100,
                                ),
                                findList[index].free == true
                                    ? Row(
                                        children: [
                                          SizedBox(
                                            width: screenSize.width / 60,
                                          ),
                                        ],
                                      )
                                    : const SizedBox(
                                        height: 0,
                                      ),
                                SizedBox(
                                  height: screenSize.height / 100,
                                ),
                              ],
                            ),
                          ),
                        );
                      }))
            ],
          )),
    );
  }
}
