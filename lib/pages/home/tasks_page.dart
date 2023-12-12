import 'package:cse_organizers_app/Services/data_manager.dart';
import 'package:cse_organizers_app/constants.dart';
import 'package:cse_organizers_app/data/event_data.dart';
import 'package:cse_organizers_app/data/user_data.dart';
import 'package:cse_organizers_app/icons/c_s_e_organizers_app_icons.dart';
import 'package:cse_organizers_app/models/event.dart';
import 'package:cse_organizers_app/pages/home/participants_page.dart';
import 'package:cse_organizers_app/constants.dart' as constants;

import 'package:flutter/material.dart';
import 'package:cse_organizers_app/Services/event_service.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:intl/intl.dart';

import '../../models/task.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({super.key});
  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  final List<String> daysList = []; // liste des jours
  final List<Task> todaysTasks = [];
  List<Event>? eventList = List.empty();
  int current = 0;
  int eventDAYS = EventsData.events[0].days.length;
  late List<Task> currentDayTasksList = [];
  bool free = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //event.days.length

    //on met a jour le champs free de lorganisateur connecté
    for (var element in UserData.tasks) {
      if (DateTime.now().isAfter(element.startTime) &&
          DateTime.now().isBefore(element.endTime)) {
        print("is occupied");
        free = false;
      }
    }

    updateFreeOrgnizers(free);

    //initialiser le nombre de jours
    for (var i = 1; i <= eventDAYS; i++) {
      daysList.add("DAY $i");
    }

    // initialisé la liste du 1er jour
    for (var element in UserData.tasks) {
      if (element.day == 1) {
        currentDayTasksList.add(element);
      }
    }
    //  event = Event(id: 'id', name: 'Welcome day', days: daysList);

    currentDayTasksList.sort((a, b) => a.startTime.compareTo(b.startTime));
    // to test array sorting -- i'll implement the UI real time change with Provider.
    // Timer.periodic(const Duration(seconds: 1), (timer) {
    //   if (mounted){
    //   setState(() {});
    //   }
    // });
  }

  bool Verified = false;
  String _scanBarcode = 'Unknown';

  Future<void> scanQR() async {
    String barcodeScanResult = await FlutterBarcodeScanner.scanBarcode(
      "#ff6666", // Couleur de la barre de recherche (facultatif)
      "Annuler", // Texte du bouton d'annulation (facultatif)
      true, // Utiliser l'appareil photo avant (facultatif)
      ScanMode.QR, // Mode de numérisation (QR, AZTEC, PDF417, etc.)
    );

    if (!mounted) return;
    setState(() {
      _scanBarcode = barcodeScanResult;
    });
  }

  bool traitementCode(String code) {
    for (var element in UserData.participants) {
      if (element.id == code) {
        Verified = true;
      }
    }
    if (Verified) {
      // await updateScannedParticipants( )
      return true;
    } else {
      return false;
    }
  }

  void _showDialog(BuildContext context, bool isVerified) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Icon(
              //   Icons.check_circle, // Icône de vérification
              //   color: Colors.green,
              //   size: 50.0,
              // ),
              // SizedBox(height: 20.0),
              Text(
                (isVerified)
                    ? 'Participant ID is valid'
                    : "Participant ID is unvalid",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0),
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Ferme la boîte de dialogue
                },
                icon: (isVerified)
                    ? Icon(
                        CSEOrganizersApp.checkboxChecked,
                        color: constants.colors["success"]![100],
                        size: 40.0,
                      )
                    : Icon(
                        CSEOrganizersApp.unvalid,
                        color: constants.colors["fail"]![100],
                        size: 40.0,
                      ),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return RefreshIndicator(
      onRefresh: () async {
        //on met a jour le champs free de lorganisateur connecté
        for (var element in UserData.tasks) {
          if (DateTime.now().isAfter(element.startTime) &&
              DateTime.now().isBefore(element.endTime)) {
            print("is occupied");
            free = false;
          }
        }
        updateFreeOrgnizers(free);
        //-----------------------------------------------
        //je recupere la liste des evenemnts
        List<Event> events = await EventService.getEventslist() ?? [];

        // eventList = await EventService.getEventslist();
        UserData.tasks = [];
        //je recupere la liste des taches
        await getTasks();
        UserData.organizers = [];
        await getOrganizers();
        UserData.participants = [];
        await getParticipants(EventsData.eventInfo!.id);
        //     await ParticipantService(event: ).getParticipantslist;

        setState(() {
          // currentDayTasksList = UserData.tasks;
        });
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: colors['background']!['light'],
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: screenSize.height / 5,
                color: colors['shades']!['white'],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    /*   SizedBox(
                      height: screenSize.height / 16,
                    ),*/
                    Container(
                      alignment: Alignment.topCenter,
                      child: Text(
                        'My tasks',
                        style: TextStyle(
                          color: colors['neutral']![900],
                          fontFamily: 'CSE',
                          fontWeight: FontWeight.w600,
                          fontSize: 26,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: screenSize.height / 30,
                    ),
                    Container(
                      width: double.infinity,
                      height: 70,
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Center(
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: eventDAYS,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  current = index;

                                  currentDayTasksList = [];
                                  for (var element in UserData.tasks) {
                                    if (element.day == (index + 1)) {
                                      currentDayTasksList.add(element);
                                    }
                                  }
                                  currentDayTasksList.sort((a, b) =>
                                      a.startTime.compareTo(b.startTime));
                                });
                              },
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                height: 45,
                                width: 120,
                                margin: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: current == index
                                      ? colors['primary']![500]
                                      : colors['background']!['light'],
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      daysList[index],
                                      // event.days[index],
                                      style: TextStyle(
                                        color: (current == index)
                                            ? colors['shades']!['white']
                                            : colors['neutral']![900],
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: screenSize.height / 80,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: currentDayTasksList.length,
                    itemBuilder: (context, index) {
                      if (currentDayTasksList[index].checkIn == true) {
                        return Padding(
                          padding: EdgeInsets.only(
                              top: index == 0 ? 0.0 : 16.0,
                              bottom: 16.0,
                              left: 24.0,
                              right: 24.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: (DateTime.now().isAfter(
                                          currentDayTasksList[index]
                                              .startTime) &&
                                      DateTime.now().isBefore(
                                          currentDayTasksList[index].endTime))
                                  ? colors['primary']![100]
                                  : colors['shades']!['white'],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          currentDayTasksList[index].title,
                                          style: TextStyle(
                                            color: (DateTime.now().isAfter(
                                                        currentDayTasksList[
                                                                index]
                                                            .startTime) &&
                                                    DateTime.now().isBefore(
                                                        currentDayTasksList[
                                                                index]
                                                            .endTime))
                                                ? colors['neutral']![900]
                                                : colors['neutral']![900]!
                                                    .withOpacity(0.3),
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            CSEOrganizersApp.clock,
                                            color: (DateTime.now().isAfter(
                                                        currentDayTasksList[
                                                                index]
                                                            .startTime) &&
                                                    DateTime.now().isBefore(
                                                        currentDayTasksList[
                                                                index]
                                                            .endTime))
                                                ? colors['neutral']![900]
                                                : colors['neutral']![900]!
                                                    .withOpacity(0.3),
                                          ),
                                          Text(
                                            '${DateFormat('HH:mm').format(currentDayTasksList[index].startTime)}-${DateFormat('HH:mm').format(currentDayTasksList[index].endTime)}',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              color: (DateTime.now().isAfter(
                                                          currentDayTasksList[
                                                                  index]
                                                              .startTime) &&
                                                      DateTime.now().isBefore(
                                                          currentDayTasksList[
                                                                  index]
                                                              .endTime))
                                                  ? colors['neutral']![900]
                                                  : colors['neutral']![900]!
                                                      .withOpacity(0.3),
                                              fontFamily: 'Poppins',
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: Text(
                                        currentDayTasksList[index].description,
                                        style: TextStyle(
                                          color: (DateTime.now().isAfter(
                                                      currentDayTasksList[index]
                                                          .startTime) &&
                                                  DateTime.now().isBefore(
                                                      currentDayTasksList[index]
                                                          .endTime))
                                              ? colors['neutral']![900]
                                              : colors['neutral']![900]!
                                                  .withOpacity(0.5),
                                          fontFamily: 'Poppins',
                                          fontSize: 13,
                                        ),
                                      )),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0, vertical: 16.0),
                                    child: Divider(
                                      color: (DateTime.now().isAfter(
                                                  currentDayTasksList[index]
                                                      .startTime) &&
                                              DateTime.now().isBefore(
                                                  currentDayTasksList[index]
                                                      .endTime))
                                          ? colors['neutral']![900]
                                          : colors['neutral']![900]!
                                              .withOpacity(0.5),
                                      thickness: 1,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 16.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        MaterialButton(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                          elevation: 0.0,
                                          onPressed: () async {
                                            await scanQR();
                                            //ici se fait la logique de traitement
                                            // à ce point l'information generee a partir du code qr est dans la variable _scanBarcode
                                            bool done = traitementCode(
                                                _scanBarcode); //elle retourne toujours la meme chose
                                            _showDialog(context, done);
                                            if (done) {
                                              //je modifie le champs scanned de mon participant
                                              await updateScannedParticipants(
                                                  _scanBarcode, true);
                                              UserData.participants = [];
                                              await getParticipants(
                                                  EventsData.eventInfo!.id);
                                            }
                                          },
                                          color: (DateTime.now().isAfter(
                                                      currentDayTasksList[index]
                                                          .startTime) &&
                                                  DateTime.now().isBefore(
                                                      currentDayTasksList[index]
                                                          .endTime))
                                              ? colors['primary']![500]
                                              : colors['primary']![500]!
                                                  .withOpacity(0.7),
                                          child: Padding(
                                            padding: const EdgeInsets.all(6.0),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  CSEOrganizersApp.camera,
                                                  color: (DateTime.now().isAfter(
                                                              currentDayTasksList[
                                                                      index]
                                                                  .startTime) &&
                                                          DateTime.now().isBefore(
                                                              currentDayTasksList[
                                                                      index]
                                                                  .endTime))
                                                      ? colors['shades']![
                                                          'white']
                                                      : colors['shades']![
                                                              'white']!
                                                          .withOpacity(0.5),
                                                ),
                                                SizedBox(
                                                  width: screenSize.width / 50,
                                                ),
                                                Text(
                                                  'Scan',
                                                  style: TextStyle(
                                                    color: (DateTime.now().isAfter(
                                                                currentDayTasksList[
                                                                        index]
                                                                    .startTime) &&
                                                            DateTime.now().isBefore(
                                                                currentDayTasksList[
                                                                        index]
                                                                    .endTime))
                                                        ? colors['shades']![
                                                            'white']
                                                        : colors['shades']![
                                                                'white']!
                                                            .withOpacity(0.7),
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 13,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: screenSize.width / 20,
                                        ),
                                        MaterialButton(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                          elevation: 0.0,
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ParticipantPage()));
                                          },
                                          color: colors['shades']!['white'],
                                          child: Padding(
                                            padding: const EdgeInsets.all(6.0),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Participants',
                                                  style: TextStyle(
                                                    color: (DateTime.now().isAfter(
                                                                currentDayTasksList[
                                                                        index]
                                                                    .startTime) &&
                                                            DateTime.now().isBefore(
                                                                currentDayTasksList[
                                                                        index]
                                                                    .endTime))
                                                        ? colors['shades']![
                                                            'black']
                                                        : colors['shades']![
                                                                'black']!
                                                            .withOpacity(0.3),
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 13,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: screenSize.width / 50,
                                                ),
                                                Icon(
                                                  CSEOrganizersApp.arrow,
                                                  color: (DateTime.now().isAfter(
                                                              currentDayTasksList[
                                                                      index]
                                                                  .startTime) &&
                                                          DateTime.now().isBefore(
                                                              currentDayTasksList[
                                                                      index]
                                                                  .endTime))
                                                      ? colors['shades']![
                                                          'black']
                                                      : colors['shades']![
                                                              'black']!
                                                          .withOpacity(0.3),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      } else {
                        return Padding(
                          padding: EdgeInsets.only(
                              top: index == 0 ? 0.0 : 16.0,
                              bottom: 16.0,
                              left: 24.0,
                              right: 24.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: (DateTime.now().isAfter(
                                          currentDayTasksList[index]
                                              .startTime) &&
                                      DateTime.now().isBefore(
                                          currentDayTasksList[index].endTime))
                                  ? colors['primary']![100]
                                  : colors['shades']!['white'],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Text(
                                          currentDayTasksList[index].title,
                                          style: TextStyle(
                                            color: (DateTime.now().isAfter(
                                                        currentDayTasksList[
                                                                index]
                                                            .startTime) &&
                                                    DateTime.now().isBefore(
                                                        currentDayTasksList[
                                                                index]
                                                            .endTime))
                                                ? colors['neutral']![900]
                                                : colors['neutral']![900]!
                                                    .withOpacity(0.3),
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            CSEOrganizersApp.clock,
                                            color: (DateTime.now().isAfter(
                                                        currentDayTasksList[
                                                                index]
                                                            .startTime) &&
                                                    DateTime.now().isBefore(
                                                        currentDayTasksList[
                                                                index]
                                                            .endTime))
                                                ? colors['neutral']![900]
                                                : colors['neutral']![900]!
                                                    .withOpacity(0.3),
                                          ),
                                          Text(
                                            // '${currentDayTasksList[index].startTime.hour}:${currentDayTasksList[index].startTime.minute}',
                                            '${DateFormat('HH:mm').format(currentDayTasksList[index].startTime)}-${DateFormat('HH:mm').format(currentDayTasksList[index].endTime)}',
                                            style: TextStyle(
                                                color: (DateTime.now().isAfter(
                                                            currentDayTasksList[
                                                                    index]
                                                                .startTime) &&
                                                        DateTime.now().isBefore(
                                                            currentDayTasksList[
                                                                    index]
                                                                .endTime))
                                                    ? colors['neutral']![900]
                                                    : colors['neutral']![900]!
                                                        .withOpacity(0.3),
                                                fontFamily: 'Poppins',
                                                overflow:
                                                    TextOverflow.ellipsis),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0, vertical: 8.0),
                                    child: Text(
                                      currentDayTasksList[index].description,
                                      style: TextStyle(
                                        color: (DateTime.now().isAfter(
                                                    currentDayTasksList[index]
                                                        .startTime) &&
                                                DateTime.now().isBefore(
                                                    currentDayTasksList[index]
                                                        .endTime))
                                            ? colors['neutral']![900]
                                            : colors['neutral']![900]!
                                                .withOpacity(0.5),
                                        fontFamily: 'Poppins',
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
