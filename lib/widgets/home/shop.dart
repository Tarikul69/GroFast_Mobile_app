import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gro_fast/controllers/shop_controller.dart';
import 'package:gro_fast/model/shop_model.dart';

class shop extends StatefulWidget {
  const shop({super.key});

  @override
  State<shop> createState() => _shopState();
}

class _shopState extends State<shop> {
  final ShopController shopController = Get.put(ShopController());

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)!.settings.arguments as ShopArguments;
    shopController.setShopId(args.shop_id); // ✅ Called only once
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ShopArguments;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text("${args.shop_name}"),
      ),
      body: Obx(() {
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
      }),
    );
  }
}
