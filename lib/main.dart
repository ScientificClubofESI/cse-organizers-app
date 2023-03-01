import 'package:cse_organizers_app/presentation/c_s_e_organizers_app_icons.dart';
import 'package:flutter/material.dart';
import 'package:cse_organizers_app/constants.dart' as constants;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: constants.title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(constants.title),
        ),
        body: Center(
          child: Icon(
            CSEOrganizersApp.unvalid,
            color: constants.colors['fail']![100],
            size: 40,
          ),
        ),
      ),
    );
  }
}
