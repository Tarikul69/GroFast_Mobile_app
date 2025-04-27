import 'package:flutter/material.dart';
import 'package:gro_fast/components/components.dart';

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            textFormField(hintText: "hintText", icon: Icons.pin),
            elevatedButton(text: "Submit", onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
