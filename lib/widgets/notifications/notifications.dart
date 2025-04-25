import 'package:flutter/material.dart';

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
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [],
        ),
      ),
    );
  }
}
