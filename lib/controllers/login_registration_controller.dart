import 'package:get/get.dart';
import 'package:gro_fast/model/login_registration_model.dart';
import 'package:gro_fast/network/api_service.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;

  Future<void> login(LoginModel model) async {
    isLoading(true);
    try {
      final response = await ApiService.postData(
        endpoint: '/auth/login/',
        body: model.toJson(),
      );
      print('Login Success: $response');

      // You can handle tokens or navigation here
    } catch (e) {
      print('Login Failed: $e');
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading(false);
    }
  }
}
