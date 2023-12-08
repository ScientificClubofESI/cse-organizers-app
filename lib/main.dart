import 'package:cse_organizers_app/firebase_options.dart';
import 'package:cse_organizers_app/pages/home_page.dart';
import 'package:cse_organizers_app/pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cse_organizers_app/constants.dart' as constants;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: constants.title,
      routes: {
        '/': (context) => const LoginPage(),
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}
/* 
  To use colors:
      import 'package:cse_organizers_app/constants.dart' as constants;
      
      constants.colors[<name-of-color>]![<number-of-color>]

  To use icons:
      import 'package:cse_organizers_app/presentation/c_s_e_organizers_app_icons.dart';

      CSEOrganizersApp.<name-of-icon>
*/
