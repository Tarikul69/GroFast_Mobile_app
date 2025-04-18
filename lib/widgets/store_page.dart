import 'package:flutter/material.dart';

class store_page extends StatefulWidget {
  const store_page({super.key});

  @override
  State<store_page> createState() => _store_pageState();
}

class _store_pageState extends State<store_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Store App"),
      ),
    );
  }
}
