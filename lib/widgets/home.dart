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
    productsFuture = ApiService().fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users List"),
        backgroundColor: Colors.green,
      ),
      body: FutureBuilder<List<Product>>(
        future: productsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No users found."));
          }

          final products = snapshot.data!;

          return ListView.builder(
            itemCount: products.length,
            padding: const EdgeInsets.all(12),
            itemBuilder: (context, index) {
              final user = products[index];

              return Card(
                elevation: 4,
                margin: const EdgeInsets.symmetric(vertical: 8),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(user.profile_picture),
                    radius: 25,
                  ),
                  title: Text(user.usersname),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Email: ${user.email}"),
                      Text("Phone: ${user.phone_number}"),
                      Text("Address: ${user.address}"),
                      Text("Verified: ${user.is_verified}"),
                      Text("Joined: ${user.created_at}"),
                    ],
                  ),
                  isThreeLine: true,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
