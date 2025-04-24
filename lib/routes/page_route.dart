import 'package:get/get.dart';
import 'package:gro_fast/widgets/home/home.dart';
import 'package:gro_fast/widgets/login_registration/forgetpassword.dart';
import 'package:gro_fast/widgets/login_registration/login.dart';
import 'package:gro_fast/widgets/login_registration/registration.dart';
import 'package:gro_fast/widgets/notifications/notifications.dart';
import 'package:gro_fast/widgets/profile/profile.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(name: AppRoutes.home, page: () => home()),
    GetPage(name: AppRoutes.login, page: () => login()),
    GetPage(name: AppRoutes.forgetpassword, page: () => forgetpassword()),
    GetPage(name: AppRoutes.registration, page: () => registration()),
    GetPage(name: AppRoutes.profile, page: () => profile()),
    GetPage(name: AppRoutes.notifications, page: () => notifications())
  ];
}
