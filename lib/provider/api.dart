import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ApiController {
  static const String URL_API = "https://d4ts3cxh-5000.asse.devtunnels.ms";

 Future<http.Response> fetchData() async {
    // final SharedPreferences shared = await SharedPreferences.getInstance();
    // String? getToken = shared.getString("accessToken");
    try {
      Uri url = Uri.parse('$URL_API/api/sensor');
      final response = await http.get(url, headers: {
        'Content-Type': 'application/json',
        // 'Authorization': 'Bearer $getToken',
      });
      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception(
            'Failed to fetch data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error during fetchData: $e');
      throw e;
    }
  }
  Future login(Map<String, dynamic> data) async {
    try {
      final response = await http.post(Uri.parse('$URL_API/user/login'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(data)
      );
      return response;
    } catch (e) {
      throw e;
    }
  }
  Future register(Map<String, dynamic> data) async {
    try {
      final response = await http.post(Uri.parse('$URL_API/user/register'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(data)
      );
      return response;
    } catch (e) {
      throw e;
    }
  }
}