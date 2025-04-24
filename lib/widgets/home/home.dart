import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gro_fast/model/add_model.dart';
import 'package:gro_fast/model/model.dart';
import 'package:gro_fast/model/users_model.dart';
import 'package:gro_fast/routes/app_routes.dart';
import '../../network/api_service.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  late Future<List<Shop_list>> shop_list;
  late Future<List<Users_model>> users_model;

  List<dynamic> shops = [];
  List<dynamic> users = [];

  @override
  void initState() {
    super.initState();
    // getData('/admin_panel/shop_list/');
    //ApiService().getData(endpoint: '');
    fetchAllData();
  }

  //
  Future<void> fetchAllData() async {
    try {
      final results = await Future.wait([
        getData(endpoint: '/users/shops/'),
        // ApiService().getData(endpoint: '/admin_panel/users/'),
      ]);

      setState(() {
        dynamic shops = results[0]; // First API response
        dynamic users = results[1]; // Second API response
      });
    } catch (e) {
      print("Error fetching data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final userName =
        users.isNotEmpty ? posts[0]['username'] ?? 'No Name' : 'Loading...';
    final userEmail = users.isNotEmpty ? posts[0]['email'] ?? '' : '';

    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          leading: CircleAvatar(),
          title: Text('${posts.length}'),
          subtitle: Text(userEmail),
          trailing: InkWell(
            onTap: () {
              Get.toNamed(AppRoutes.registration);
            },
            child: Icon(Icons.notifications),
          ),
        ),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemCount: posts.length,
        padding: const EdgeInsets.all(12),
        itemBuilder: (context, index) {
          return Column(
            children: [
              //Add Portion
              if (users.isNotEmpty)
                Card(
                  child: Text('${users.length}'),
                ),

              //All shop list
              if (posts.isNotEmpty)
                Card(
                    elevation: .1,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(''),
                        radius: 25,
                      ),
                      title: Text(posts[index]['shop_name']),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(posts[index]['shop_address']),
                          Text("Email:${posts[index]['shop_phone_number']}"),
                          //Text("Phone: ${user.phone_number}"),
                          //Text("Address: ${user.address}"),
                          //Text("Verified: ${user.is_verified}"),
                          //Text("Joined: ${user.created_at}"),
                        ],
                      ),
                    ))
              else
                Card()
            ],
          );
        },
      ),
    );
  }
}
