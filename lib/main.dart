import 'package:flutter/material.dart';
import 'package:gro_fast/widgets/home/home.dart';
import 'package:gro_fast/widgets/home/test.dart';
import 'package:gro_fast/widgets/login_registration/login.dart';
import 'package:gro_fast/widgets/login_registration/registration.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GroFast',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      //home: home());
      home: registration(),
    );
  }
}
