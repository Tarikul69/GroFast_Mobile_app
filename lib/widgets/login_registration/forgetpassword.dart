import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gro_fast/components/components.dart';
import 'package:gro_fast/routes/app_routes.dart';
import 'package:gro_fast/styles/style.dart';

class forgetpassword extends StatefulWidget {
  const forgetpassword({super.key});

  @override
  State<forgetpassword> createState() => _forgetpasswordState();
}

class _forgetpasswordState extends State<forgetpassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Forget Password",
              style: textStyle(20),
            ),
            SizedBox(
              height: 15,
            ),
            textFormField(hintText: "Enter email address", icon: Icons.email),
            SizedBox(
              height: 15,
            ),
            elevatedButton(
              text: "Confirm",
              color: Colors.black,
              onPressed: () {
                snackbar_msg(
                  context: context,
                  message: "Please check your email",
                );
                Get.offAllNamed(AppRoutes.verification_pin);
              },
            ),
          ],
        ),
      ),
    );
  }
}
