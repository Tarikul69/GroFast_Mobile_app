import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gro_fast/components/components.dart';
import 'package:gro_fast/styles/style.dart';
import 'package:gro_fast/widgets/login_registration/login.dart';

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
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            textFormField(
              hintText: "Enter Your Name",
              icon: Icons.person,
              //message: "Enter your name"
            ),
            SizedBox(
              height: 15,
            ),
            textFormField(
              hintText: "Enter Your Email",
              icon: Icons.email,
              //message: "Enter your email",
            ),
            SizedBox(
              height: 15,
            ),
            textFormField(
              hintText: "Password",
              icon: Icons.password,
              //message: "Password",
            ),
            SizedBox(
              height: 15,
            ),
            textFormField(
              hintText: "Confirm Password",
              icon: Icons.password,
              //message: "Confirm Password",
            ),
            SizedBox(
              height: 15,
            ),
            elevatedButton(
                text: "Registration",
                color: Colors.black,
                onPressed: () {
                  Get.to(login());
                })
          ],
        ),
      ),
    );
  }
}
