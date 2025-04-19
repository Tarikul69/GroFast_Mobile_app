import 'package:flutter/material.dart';
import 'package:gro_fast/model/users_model.dart';
import 'package:gro_fast/network/api_service.dart';

class test extends StatefulWidget {
  const test({super.key});

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  late Future<List<Users_model>> users_model;
  List<dynamic> users = [];

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    try {
      final result = await getData(endpoint: '/admin_panel/users/');
      setState(() {
        users = result;
      });
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users: ${users.length}'),
      ),
      body: Center(
        child: users.isEmpty
            ? CircularProgressIndicator()
            : ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(users[index]['name'] ?? 'No name'),
                  );
                },
              ),
      ),
    );
  }
}
