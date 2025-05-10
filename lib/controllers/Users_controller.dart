import 'package:get/get.dart';
import 'package:gro_fast/network/api_service.dart';

class Users_controller extends GetxController {
  var users = [].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
    //print(users);
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
