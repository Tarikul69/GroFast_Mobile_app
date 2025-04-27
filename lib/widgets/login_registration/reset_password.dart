import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gro_fast/components/components.dart';
import 'package:gro_fast/routes/app_routes.dart';

class reset_password extends StatelessWidget {
  const reset_password({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Reset Password"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            textFormField(hintText: "New Password", icon: Icons.password),
            SizedBox(
              height: 15,
            ),
            textFormField(hintText: "Confirm Password", icon: Icons.password),
            SizedBox(
              height: 15,
            ),
            elevatedButton(
              text: "Confirm",
              onPressed: () {
                Get.toNamed(AppRoutes.login);
              },
            ),
          ],
        ),
      ),
    );
  }
}
