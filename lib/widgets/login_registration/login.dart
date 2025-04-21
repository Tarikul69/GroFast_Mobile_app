import 'package:flutter/material.dart';
import 'package:gro_fast/components/components.dart';
import 'package:gro_fast/styles/style.dart';

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
            elevatedButton(
              text: "Login",
              onPressed: () {},
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
