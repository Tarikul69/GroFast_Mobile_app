import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gro_fast/routes/app_routes.dart';
import 'package:gro_fast/controllers/Home_controller.dart';

class home extends StatelessWidget {
  home({super.key});

  final Home_controller home_controller = Get.put(Home_controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() {
          final userEmail = home_controller.users.isNotEmpty
              ? home_controller.users[0]['email'] ?? ''
              : 'Loading...';

          return ListTile(
            leading: InkWell(
              onTap: () => Get.toNamed(AppRoutes.profile),
              child: const CircleAvatar(),
            ),
            title: Text(home_controller.users.isNotEmpty
                ? home_controller.users[0]['username'] ?? 'No Name'
                : 'Loading...'),
            subtitle: Text(userEmail),
            trailing: InkWell(
              onTap: () => Get.toNamed(AppRoutes.notifications),
              child: const Icon(Icons.notifications),
            ),
          );
        }),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Obx(
            () {
              if (home_controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              return ListView.builder(
                itemCount: home_controller.shops.length,
                padding: const EdgeInsets.all(12),
                itemBuilder: (context, index) {
                  final shop = home_controller.shops[index];

                  return Card(
                    elevation: .1,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: const CircleAvatar(
                        backgroundImage: NetworkImage(''),
                        radius: 25,
                      ),
                      title: Text(shop['shop_name']),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(shop['shop_address']),
                          Text("Email: ${shop['shop_phone_number']}"),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
