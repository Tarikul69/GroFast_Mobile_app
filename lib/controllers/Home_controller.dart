import 'package:get/get.dart';
import '../../network/api_service.dart';

class Home_controller extends GetxController {
  var shops = [].obs;
  var users = [].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchAllData();
  }

  void fetchAllData() async {
    try {
      isLoading(true);
      final results = await Future.wait([
        getData(endpoint: '/users/shops/'),
        getData(endpoint: '/admin_panel/users/'),
      ]);
      shops.assignAll(results[0]);
      users.assignAll(results[1]);
    } catch (e) {
      print("Error fetching data: $e");
    } finally {
      isLoading(false);
    }
  }
}
