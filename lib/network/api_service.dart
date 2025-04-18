import 'dart:convert';
import 'package:http/http.dart' as http;

List<dynamic> posts = [];
List<dynamic> users = [];

class ApiService {
//###############################//
//### Api Service useing http ###//
//###############################//
  Future getData({required String endpoint}) async {
    final url = Uri.parse('http://192.168.26.186:8000${endpoint}');
    //final url = Uri.parse('http://192.168.26.186:8000/admin_panel/shop_list/');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final json_data = jsonDecode(response.body);
      posts = json_data["shops"] as List;
      users = json_data["users"] as List;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
