import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

var base_url = 'http://192.168.26.186:8000';
//////////////////////////////////////////
///Function to fetch data from the API///
/////////////////////////////////////////
Future<List<dynamic>> getData(
    {required String endpoint, required String key}) async {
  final url = Uri.parse(base_url + endpoint);
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final json_data = jsonDecode(response.body);

    // Check the key to ensure correct data is being fetched
    if (key == 'shops') {
      return json_data['data'] as List; // Extract "data" from the response
    } else if (key == 'users') {
      return json_data['data'] as List; // Extract "data" from the response
    } else {
      throw Exception('Unknown key provided');
    }
  } else {
    throw Exception('Failed to load data');
  }
}

////////////////////////////////////////////
///POST Function to send data to the API///
///////////////////////////////////////////
// services/api_service.dart

class ApiService {
  static final Dio _dio = Dio(BaseOptions(
    baseUrl: base_url, // Change this
    headers: {'Content-Type': 'application/json'},
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
  ));

  static Future<dynamic> postData({
    required String endpoint,
    required Map<String, dynamic> body,
  }) async {
    try {
      final response = await _dio.post(base_url + endpoint, data: body);
      return response.data;
    } on DioException catch (e) {
      throw Exception('Dio error: ${e.response?.data ?? e.message}');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }
}
