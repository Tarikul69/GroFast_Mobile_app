import 'package:flutter/material.dart';
import 'package:gro_fast/widgets/home/home.dart';
import 'package:gro_fast/widgets/profile/profile.dart';

class bottom_navigationbar extends StatelessWidget {
  const bottom_navigationbar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: TabBarView(
          children: [
            home(),
            profile(),
            home(),
            profile(),
          ],
        ),
        bottomNavigationBar: Container(
          height: 80,
          width: MediaQuery.of(context).size.width,
          child: const TabBar(
            indicatorWeight: .1,
            labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            unselectedLabelStyle:
                TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
            unselectedLabelColor: Colors.black,
            labelColor: Color.fromARGB(255, 217, 195, 220),
            tabs: [
              Tab(text: "Home", icon: Icon(Icons.home)),
              Tab(
                text: "Report",
                icon: Icon(Icons.padding_outlined),
              ),
              Tab(
                text: "Activity",
                icon: Icon(Icons.work),
              ),
              Tab(
                text: "Profile",
                icon: Icon(Icons.person),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
