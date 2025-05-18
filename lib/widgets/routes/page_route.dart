import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gro_fast/widgets/home/home.dart';
import 'package:gro_fast/widgets/home/shop.dart';
import 'package:gro_fast/widgets/login_registration/forgetpassword.dart';
import 'package:gro_fast/widgets/login_registration/login.dart';
import 'package:gro_fast/widgets/login_registration/registration.dart';
import 'package:gro_fast/widgets/login_registration/reset_password.dart';
import 'package:gro_fast/widgets/login_registration/verification_pin.dart';
import 'package:gro_fast/widgets/my_offers/my_offers.dart';
import 'package:gro_fast/widgets/my_offers/offers_details.dart';
import 'package:gro_fast/widgets/notifications/notifications.dart';
import 'package:gro_fast/widgets/profile/profile.dart';
import 'package:gro_fast/widgets/splash_screen/splashscreen.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(name: AppRoutes.splashscreen, page: () => splashscreen()),
    GetPage(name: AppRoutes.home, page: () => home()),
    GetPage(name: AppRoutes.login, page: () => login()),
    GetPage(name: AppRoutes.forgetpassword, page: () => forgetpassword()),
    GetPage(name: AppRoutes.registration, page: () => registration()),
    GetPage(name: AppRoutes.profile, page: () => profile()),
    GetPage(name: AppRoutes.notifications, page: () => notifications()),
    GetPage(name: AppRoutes.bottom_navigationbar, page: () => BottomAppBar()),
    GetPage(name: AppRoutes.verification_pin, page: () => verification_pin()),
    GetPage(name: AppRoutes.reset_password, page: () => reset_password()),
    GetPage(name: AppRoutes.shop, page: () => shop()),
    GetPage(name: AppRoutes.offers_details, page: () => offers_details()),
    //My Offers
    GetPage(name: AppRoutes.my_offers, page: () => my_offers()),
    //
  ];
}
