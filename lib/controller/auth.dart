import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splendor_player/url.dart';

Future<bool> login(String username, String password) async {
  final response = await http.post(
    Uri.parse('${url}auth/login'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'username': username,
      'password': password,
    }),
  );

  if (response.statusCode == 200) {
    // Đăng nhập thành công
    final responseData = jsonDecode(response.body);
    // Lưu token vào đâu đó, ví dụ: SharedPreferences
    String token = responseData['token'];
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
    print('Status code: ${response.statusCode}');
    print('token: ${response.body}');

    return true;
  } else {
    // Đăng nhập thất bại
    print('Registration failed with status code: ${response.statusCode}');
    print('Error message: ${response.body}');
    return false;
  }
}

Future<bool> register(String username, String password) async {
  final response = await http.post(
    Uri.parse('${url}auth/register'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'username': username,
      'password': password,
    }),
  );

  if (response.statusCode == 200) {
    // Đăng ký thành công
    return true;
  } else {
    // Đăng ký thất bại
    print('Registration failed with status code: ${response.statusCode}');
    print('Error message: ${response.body}');
    return false;
  }
}

Future<bool> logout() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('token');

  if (token != null) {
    final response = await http.post(
      Uri.parse('${url}auth/logout'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      // Xóa token từ SharedPreferences
      await prefs.remove('token');
      return true;
    } else {
      // Đăng xuất thất bại
      print('Logout failed with status code: ${response.statusCode}');
      print('Error message: ${response.body}');
      return false;
    }
  } else {
    // Người dùng chưa đăng nhập
    print('User not logged in');
    return false;
  }
}