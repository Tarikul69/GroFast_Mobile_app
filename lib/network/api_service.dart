import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:gro_fast/model/model.dart';
import 'package:http/http.dart' as http;

// class ApiService {
//   final Dio _dio = Dio(BaseOptions(
//     baseUrl: 'http://192.168.26.186:8000', // Replace with your real API
//     connectTimeout: const Duration(seconds: 10),
//     receiveTimeout: const Duration(seconds: 10),
//   ));
//   Future<List<Map<String, String>>> fetchData() {
//     // TODO: implement fetchData
//     throw UnimplementedError();
//   }

//   Future<List<Product>> fetchProducts() async {
//     try {
//       final response = await _dio.get('/admin_panel/users/');

//       if (response.statusCode == 200) {
//         List data = response.data;
//         return data.map((item) => Product.fromJson(item)).toList();
//       } else {
//         throw Exception('Failed to load products');
//       }
//     } catch (e) {
//       throw Exception('API Error: $e');
//     }
//   }
// }
///
List<dynamic> posts = [];

class ApiService {
  final Dio _dio = Dio();

  Future<List<Product>> fetchProducts() async {
    try {
      final response = await _dio.get(
          'http://192.168.26.186:8000/admin_panel/shop_list/'); // Replace with real URL

      // Fix: access nested data
      final List data = response
          .data['data']; // 👈 assumes your API returns { "data": [...] }

      return data.map((json) => Product.fromJson(json)).toList();
    } catch (e) {
      print('API error: $e');
      throw Exception("Failed to fetch products");
    }
  }
}

//Api Service useing http
Future getData({required String endpoint}) async {
  final url = Uri.parse('http://192.168.26.186:8000${endpoint}');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final json_data = jsonDecode(response.body);
    posts = json_data["shops"] as List;
  } else {
    print("Failed");
  }
}
