import 'package:carousel_slider/carousel_slider.dart'
    show CarouselOptions, CarouselSlider;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gro_fast/components/components.dart';
import 'package:gro_fast/controllers/Home_controller.dart';
import 'package:gro_fast/controllers/Users_controller.dart';
import 'package:gro_fast/model/shop_model.dart';
import 'package:gro_fast/routes/app_routes.dart';
import 'package:gro_fast/styles/style.dart';

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
              ? users_controller.users[1]['email'] ?? 'Loading...'
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

          return SingleChildScrollView(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    height: 250,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: false,
                    autoPlay: true,
                  ),
                  items: home_controller.shops.map((shop) {
                    return Builder(
                      builder: (BuildContext context) {
                        return InkWell(
                          onTap: () {
                            //Navigator.pushNamed(context, AppRoutes.shop, arguments: args);
                          },
                          child: Card(
                            elevation: 4,
                            margin: const EdgeInsets.all(8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const CircleAvatar(
                                    radius: 30,
                                    backgroundImage:
                                        AssetImage('assets/images/shop.png'),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    "${shop['shop_name'] ?? 'No Name'}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  Text(shop['shop_address'] ?? 'No Address'),
                                  Text(
                                      "Phone: ${shop['shop_phone_number'] ?? 'N/A'}"),
                                  Text(
                                      "Rating: ${shop['shop_rating'] ?? '0.0'}"),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
                Text(
                  "Shop List",
                  //strutStyle: textStyle(15.0),
                ),
                for (int index = 0;
                    index < home_controller.shops.length;
                    index++)
                  Builder(
                    builder: (context) {
                      final shop = home_controller.shops[index];
                      final args =
                          ShopArguments(shop['shop_id'], shop['shop_name']);

                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, AppRoutes.shop,
                              arguments: args);
                        },
                        child: Card(
                          elevation: 1,
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListTile(
                            leading: const CircleAvatar(
                              radius: 25,
                              backgroundImage:
                                  AssetImage('assets/images/shop.png'),
                            ),
                            title: Text(
                              "${shop['shop_name'] ?? 'No Name'}",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(shop['shop_address'] ?? 'No Address'),
                                //Text("Phone: ${shop['shop_phone_number'] ?? 'N/A'}"),
                                Text(
                                  "Rating: ${shop['shop_rating']}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
