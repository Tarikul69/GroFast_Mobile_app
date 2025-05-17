import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gro_fast/controllers/shop_controller.dart';
import 'package:gro_fast/model/shop_model.dart';
import 'package:gro_fast/styles/style.dart';

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
      body: //Obx(
          //() {
          // if (shopController.isLoading.value) {
          //   return const Center(child: CircularProgressIndicator());
          // }

          // if (shopController.category.isEmpty) {
          //   return const Center(child: Text("No categories found.."));
          // }

          SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(6, 0, 6, 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .25,
              width: MediaQuery.of(context).size.width,
              child: Card(
                elevation: 4,
                color: const Color.fromARGB(255, 255, 255, 255),
                margin: const EdgeInsets.all(8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Container(
                  height: 2,
                  padding: const EdgeInsets.all(12),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/placeholder_image/image2.png'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            Text(
              "Product Category",
              style: textStyle(20),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  category_card(
                      'Fruits', 'assets/placeholder_image/category.png'),
                  category_card(
                      'Vegetables', 'assets/placeholder_image/category.png'),
                  category_card(
                      'Dairy', 'assets/placeholder_image/category.png'),
                  category_card(
                      'Meat and fish', 'assets/placeholder_image/category.png'),
                  category_card(
                      'Frozen foods', 'assets/placeholder_image/category.png'),
                  category_card(
                      'Snacks', 'assets/placeholder_image/category.png'),
                  category_card(
                      'Drinks', 'assets/placeholder_image/category.png')
                ],
              ),
            ),
            Text(
              "Test",
              style: textStyle(20),
            )
          ],
        ),
      ),
    );
  }

  Widget category_card(String categoryName, String imgPath) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 3, 0, 3),
      height: 100,
      width: MediaQuery.of(context).size.width / 4,
      child: Card(
        color: Colors.green,
        child: Column(
          children: [
            Image.asset(imgPath),
            Text(
              categoryName,
              style: textStyle(12),
            )
          ],
        ),
      ),
    );
  }
}
