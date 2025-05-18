import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gro_fast/widgets/routes/app_routes.dart';
import 'package:gro_fast/widgets/routes/page_route.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Gro Fast',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splashscreen,
      getPages: AppPages.routes,
    );
  }
}
