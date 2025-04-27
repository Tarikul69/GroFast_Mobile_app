import 'package:gro_fast/widgets/login_registration/reset_password.dart';
import 'package:gro_fast/widgets/login_registration/verification_pin.dart';
import 'package:gro_fast/widgets/notifications/notifications.dart';
import 'package:gro_fast/widgets/profile/profile.dart';
import 'package:gro_fast/widgets/splash_screen/splashscreen.dart';

abstract class AppRoutes {
  static const splashscreen = '/splashscreen';
  static const home = '/home';
  static const login = '/login';
  static const forgetpassword = '/forgetpassword';
  static const registration = '/registration';
  static const profile = '/profile';
  static const notifications = '/notifications';
  static const bottom_navigationbar = '/bottom_navigationbar';
  static const verification_pin = '/verification_pin';
  static const reset_password = '/reset_password';
}
