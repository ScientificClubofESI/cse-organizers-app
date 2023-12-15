import 'package:cse_organizers_app/icons/c_s_e_organizers_app_icons.dart';
import 'package:cse_organizers_app/pages/home/agenda_page.dart';
import 'package:cse_organizers_app/pages/home/participants_page.dart';
import 'package:cse_organizers_app/pages/home/search_page.dart';
import 'package:cse_organizers_app/pages/home/tasks_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: const TabBarView(
            children: [
          AgendaPage(),
          TasksPage(),
          SearchPage(),
        ]),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.only(topRight: Radius.circular(25),topLeft: Radius.circular(25),bottomRight: Radius.zero,bottomLeft:Radius.zero),
          ),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
