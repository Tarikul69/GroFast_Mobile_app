import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gro_fast/components/components.dart';
import 'package:gro_fast/routes/app_routes.dart';
import 'package:gro_fast/styles/style.dart';

class verification_pin extends StatelessWidget {
  const verification_pin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Verification Code"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "Verification Code",
              style: textStyle(),
            ),
            SizedBox(
              height: 15,
            ),
            textFormField(hintText: "hintText", icon: Icons.pin),
            SizedBox(
              height: 15,
            ),
            elevatedButton(
              text: "Submit",
              onPressed: () {
                snackbar_msg(context: context, title: "hi");
                Get.toNamed(AppRoutes.reset_password);
              },
            ),
          ],
        ),
      ),
    );
  }
}
