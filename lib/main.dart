import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gro_fast/routes/app_routes.dart';
import 'package:gro_fast/routes/page_route.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Gro Fast',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.registration,
      getPages: AppPages.routes,
    );
  }
}
