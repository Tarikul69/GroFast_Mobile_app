import 'package:get/get.dart';
import '/network/api_service.dart';

class Home_controller extends GetxController {
  var shops = [].obs;
  var users = [].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchShops();
    fetchUsers();
  }

  // Fetch Shops
  void fetchShops() async {
    try {
      isLoading(true);
      final shopsData =
          await getData(endpoint: '/admin_panel/shop_list/', key: 'shops');
      shops.assignAll(shopsData); // Update the shops list
    } catch (e) {
      print("Error fetching shops data: $e");
    } finally {
      isLoading(false);
    }
  }

  // Fetch Users
  void fetchUsers() async {
    try {
      isLoading(true);
      final usersData =
          await getData(endpoint: '/admin_panel/users/', key: 'users');
      users.assignAll(usersData); // Update the users list
    } catch (e) {
      print("Error fetching users data: $e");
    } finally {
      isLoading(false);
    }
  }
}
