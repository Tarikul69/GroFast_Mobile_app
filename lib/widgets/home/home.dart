import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gro_fast/controllers/Home_controller.dart';
import 'package:gro_fast/controllers/Users_controller.dart';
import 'package:gro_fast/model/shop_model.dart';
import 'package:gro_fast/routes/app_routes.dart';

class home extends StatelessWidget {
  home({super.key});

  final Home_controller home_controller = Get.put(Home_controller());
  final Users_controller users_controller = Get.put(Users_controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Obx(() {
          final userEmail = users_controller.users.isNotEmpty
              ? home_controller.users[1]['email'] ?? 'Loading...'
              : 'Loading...';

          return ListTile(
            leading: InkWell(
              onTap: () => {Get.toNamed(AppRoutes.profile)},
              child: const CircleAvatar(),
            ),
            title: Text(users_controller.users.isNotEmpty
                ? users_controller.users[1]['username'] ?? 'No Name'
                : 'Loading...'),
            subtitle: Text(userEmail),
            trailing: InkWell(
              onTap: () => print(Get.toNamed(AppRoutes.notifications)),
              child: const Icon(Icons.notifications),
            ),
          );
        }),
      ),
      body: Obx(
        () {
          if (home_controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          if (home_controller.shops.isEmpty) {
            return const Center(
              child: Text('No Shops Available'),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: home_controller.shops.length,
            itemBuilder: (context, index) {
              final shop = home_controller.shops[index];
              final args =
                  ShopArguments(shop['shop_phone_number'], shop['shop_name']);

              return InkWell(
                onTap: () {
                  //Get.toNamed(AppRoutes.shop);
                  Navigator.pushNamed(context, AppRoutes.shop, arguments: args);
                },
                child: Card(
                  elevation: 0.5,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: const CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage('assets/images/shop.png'),
                    ),
                    title: Text(
                      "${shop['shop_name'] ?? 'No Name'}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(shop['shop_address'] ?? 'No Address'),
                        Text("Phone: ${shop['shop_phone_number'] ?? 'N/A'}"),
                        Text(
                          "Rating: ${shop['shop_rating']}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
