import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:gro_fast/network/api_service.dart';

class ShopController extends GetxController {
  var category = [].obs;
  var isLoading = true.obs;
  late int shopId;

  void setShopId(int id) {
    shopId = id;
    fetchCategory(shopId);
  }

  void fetchCategory(int shopId) async {
    try {
      isLoading(true);
      final usersData = await getData(
        endpoint: '/shopowner/category_list_id/$shopId/',
        key: 'category',
      );
      print(usersData);
      category.assignAll(usersData);
    } catch (e) {
      print("Error fetching category data: $e");
    } finally {
      isLoading(false);
    }
  }
}
