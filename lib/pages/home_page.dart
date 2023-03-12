import 'package:cse_organizers_app/icons/c_s_e_organizers_app_icons.dart';
import 'package:cse_organizers_app/pages/home/agenda_page.dart';
import 'package:cse_organizers_app/pages/home/search_page.dart';
import 'package:cse_organizers_app/pages/home/tasks_page.dart';
import 'package:flutter/material.dart';
import 'package:cse_organizers_app/constants.dart' as constants;
import 'package:auto_size_text/auto_size_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    final largeur = MediaQuery.of(context).size.width;
    final hauteur = MediaQuery.of(context).size.height;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text(title),
        // ),
        body: const TabBarView(children: [
          AgendaPage(),
          TasksPage(),
          SearchPage(),
        ]),
        bottomNavigationBar: Container(
          color: constants.colors['primary']![500],
          //    height: hauteur * 0.1,

          child: const TabBar(
            tabs: [
              Tab(
                icon: Icon(CSEOrganizersApp.agenda),
                text: 'Agenda',
              ),
              Tab(
                icon: Icon(CSEOrganizersApp.tasks),
                text: 'Tasks',
              ),
              Tab(
                icon: Icon(CSEOrganizersApp.search),
                text: 'Search',
              )
            ],
          ),
        ),
      ),
    );
  }
}
