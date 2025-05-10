import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gro_fast/controllers/shop_controller.dart';
import 'package:gro_fast/model/shop_model.dart';

class offers_details extends StatefulWidget {
  @override
  State<offers_details> createState() => _offers_detailsState();
}

class _offers_detailsState extends State<offers_details> {
  final ShopController shopController = Get.put(ShopController());
  ShopArguments? args;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (args == null) {
      final data = ModalRoute.of(context)?.settings.arguments;
      if (data is ShopArguments) {
        args = data;
        shopController.setShopId(args!.shop_id);
      } else {
        Get.snackbar("Error", "Invalid or missing shop data");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (args == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Offer Details"),
      ),
      body: Obx(
        () {
          if (shopController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          if (shopController.category.isEmpty) {
            return const Center(child: Text("No categories found.."));
          }

          return ListView.builder(
            itemCount: shopController.category.length,
            itemBuilder: (context, i) {
              final category = shopController.category[i];
              return ListTile(
                title: Text(category['name'] ?? 'No Name'),
              );
            },
          );
        },
      ),
    );
  }
}
