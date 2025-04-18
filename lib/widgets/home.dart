import 'package:flutter/material.dart';
import 'package:gro_fast/model/model.dart';
import '../network/api_service.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  late Future<List<Product>> productsFuture;

  @override
  void initState() {
    super.initState();
    // getData('/admin_panel/shop_list/');
    getData(endpoint: '/admin_panel/shop_list/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users List"),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemCount: posts.length,
        padding: const EdgeInsets.all(12),
        itemBuilder: (_, index) {
          //final user = products[index];

          return Card(
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(''),
                radius: 25,
              ),
              title: Text(posts[index]['shop_name']),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(posts[index]['shop_address'])
                  //Text("Email: ${user.email}"),
                  //Text("Phone: ${user.phone_number}"),
                  //Text("Address: ${user.address}"),
                  //Text("Verified: ${user.is_verified}"),
                  //Text("Joined: ${user.created_at}"),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
