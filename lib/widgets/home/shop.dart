import 'package:flutter/material.dart';
import 'package:gro_fast/model/shop_model.dart';

class shop extends StatelessWidget {
  const shop({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ShopArguments;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text("${args.shop_name}"),
      ),
      body: Container(
        child: Column(
          children: [Text("${args.shop_phone_number}")],
        ),
      ),
    );
  }
}
