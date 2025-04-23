import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gro_fast/components/components.dart';
import 'package:gro_fast/styles/style.dart';
import 'package:gro_fast/widgets/login_registration/login.dart';
import 'package:gro_fast/widgets/routes/app_routes.dart';

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
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              SizedBox(
                height: 25,
              ),
              Text(
                "Registration",
                style: textStyle,
              ),
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
                },
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?"),
                  textButton(
                      text: "Login",
                      onPressed: () {
                        Get.toNamed(AppRoutes.login);
                      })
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
