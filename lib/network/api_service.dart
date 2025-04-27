import 'dart:convert';
import 'package:http/http.dart' as http;

// Function to fetch data from the API
Future<List<dynamic>> getData(
    {required String endpoint, required String key}) async {
  final url = Uri.parse('http://192.168.26.186:8000$endpoint');
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
