import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:gro_fast/components/components.dart';
import 'package:gro_fast/styles/style.dart';
import 'package:gro_fast/widgets/home/home.dart';
import 'package:gro_fast/widgets/login_registration/registration.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            textFormField(
              hintText: "Enter Email",
              icon: Icons.email,
              //message: "Please enter your email address",
            ),
            SizedBox(
              height: 15,
            ),
            textFormField(
              hintText: "Password",
              icon: Icons.password,
              //message: "Please enter your password",
            ),
            SizedBox(
              height: 15,
            ),
            textButton(
                text: "text",
                onPressed: () {
                  Get.to(home());
                }),
            elevatedButton(
              text: "Login",
              onPressed: () {
                Get.to(registration());
              },
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
