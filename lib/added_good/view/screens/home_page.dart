import 'package:added_good/added_good/view/sub_screens/drawer_screen.dart';
import 'package:added_good/added_good/view/sub_screens/notes_screen.dart';
import 'package:added_good/added_good/view/sub_screens/tasks_screen.dart';
import 'package:added_good/added_good/view/widgets/category_filter.dart';
import 'package:added_good/core/styles/app_colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    List<Tab> tabs = <Tab>[
      Tab(
        text: "Tasks",
        icon: Icon(
          Icons.library_add_check_rounded,
        ),
      ),
      Tab(
        text: "Notes",
        icon: Icon(Icons.sticky_note_2_rounded),
      ),
    ];

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        drawer: Drawer(
          child: DrawerScreen(),
        ),
        appBar: AppBar(
          toolbarHeight: 30,
          actions: const [
            //IconButton(onPressed: () {}, icon: Icon(Icons.language)),
            Padding(
              padding: EdgeInsets.only(right: 15,top: 10),
              child: Icon(Icons.wifi,color: Colors.green,),
            ),
          ],
          bottom: TabBar(indicatorColor: Colors.transparent, tabs: tabs),
        ),
        body: TabBarView(
          physics: BouncingScrollPhysics(),
          children: [
            TasksSection(),
            NotesSection(),
          ],
        ),
      ),
    );
  }
}
