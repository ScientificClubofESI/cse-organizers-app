import 'package:cse_organizers_app/Services/data_manager.dart';
import 'package:cse_organizers_app/Services/event_service.dart';
import 'package:cse_organizers_app/data/event_data.dart';
import 'package:cse_organizers_app/data/user_data.dart';
import 'package:cse_organizers_app/pages/home_page.dart';
import 'package:cse_organizers_app/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  bool initialized = false;
  @override
  void initState() {
    super.initState();
  }

  Future<void> init() async {
    // Get the current user
    User? user = FirebaseAuth.instance.currentUser;

    // Update UserData.uid if the user is not null
    if (user != null) {
      UserData.uid = user.uid;
    }
    await getTasks();
    await getOrganizers();

    EventsData.agenda = await getAgenda();
    EventsData.events = (await EventService.getEventslist())!;
    EventsData.eventInfo = EventsData.events[0];

    print(EventsData.events[0].days.length);

    await getParticipants('rh51g2ICQPTSJaB9V8tr');

    // Set the 'initialized' flag to true
    setState(() {
      initialized = true;
    });
    print("yas");
    print(UserData.uid);
  }

  Future<User?> getCurrentUser() async {
    return FirebaseAuth.instance.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    if (!initialized) {
      init();
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return Scaffold(
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const HomePage();
            } else {
              return const LoginPage();
            }
          },
        ),
      );
    }
  }
}
