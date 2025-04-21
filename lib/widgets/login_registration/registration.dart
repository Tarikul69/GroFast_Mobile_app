import 'package:flutter/material.dart';
import 'package:gro_fast/components/components.dart';
import 'package:gro_fast/styles/style.dart';

class registration extends StatefulWidget {
  const registration({super.key});

  @override
  State<registration> createState() => _registrationState();
}

class _registrationState extends State<registration> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text("Registration"),
      ),
      body: Container(
        child: Column(
          children: [
            textFormField(
              hintText: "Enter Your Name",
              icon: Icons.person,
              //message: "Enter your name"
            ),
            textFormField(
              hintText: "Enter Your Email",
              icon: Icons.email,
              //message: "Enter your email",
            ),
            textFormField(
              hintText: "Password",
              icon: Icons.password,
              //message: "Password",
            ),
            textFormField(
              hintText: "Confirm Password",
              icon: Icons.password,
              //message: "Confirm Password",
            ),
          ],
        ),
      ),
    );
  }
}
