import 'package:flutter/material.dart';
import 'package:gro_fast/components/card.dart';

class notifications extends StatefulWidget {
  const notifications({super.key});

  @override
  State<notifications> createState() => _notificationsState();
}

class _notificationsState extends State<notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Notifications"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              notificationCard(
                  icon: Icons.notifications, label: "Test", onTap: () {}),
              notificationCard(
                  icon: Icons.notifications, label: "Test", onTap: () {}),
              notificationCard(
                  icon: Icons.notifications, label: "Test", onTap: () {}),
              notificationCard(
                  icon: Icons.notifications, label: "Test", onTap: () {}),
              notificationCard(
                  icon: Icons.notifications, label: "Test", onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
