import 'package:get/get.dart';
import 'package:gro_fast/widgets/home/home.dart';
import 'package:gro_fast/widgets/login_registration/forgetpassword.dart';
import 'package:gro_fast/widgets/login_registration/login.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.home,
      page: () => home(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => login(),
    ),
    GetPage(name: AppRoutes.forgetpassword, page: () => forgetpassword())
  ];
}
