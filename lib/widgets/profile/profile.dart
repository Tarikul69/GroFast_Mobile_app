import 'package:flutter/material.dart';
import 'package:gro_fast/components/components.dart';
import 'package:gro_fast/styles/style.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "Profile",
          style: textStyle(20),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              profileButton(icon: Icons.home, label: "Home", onTap: () {}),
              profileButton(icon: Icons.home, label: "Home", onTap: () {}),
              profileButton(icon: Icons.home, label: "Home", onTap: () {}),
              profileButton(icon: Icons.home, label: "Home", onTap: () {}),
              profileButton(icon: Icons.home, label: "Home", onTap: () {}),
              profileButton(icon: Icons.home, label: "Home", onTap: () {}),
              profileButton(icon: Icons.home, label: "Home", onTap: () {}),
              profileButton(icon: Icons.home, label: "Home", onTap: () {}),
              profileButton(icon: Icons.home, label: "Home", onTap: () {}),
              profileButton(icon: Icons.home, label: "Home", onTap: () {}),
              profileButton(icon: Icons.home, label: "Home", onTap: () {}),
              profileButton(icon: Icons.home, label: "Home", onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
