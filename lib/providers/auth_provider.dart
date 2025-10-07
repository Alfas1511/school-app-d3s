// // lib/providers/auth_provider.dart
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../core/constants/api_constants.dart';
import '../models/login_response.dart';
import '../core/utils/shared_prefs.dart';
import 'package:school_app/views/auth/login_page.dart';

class AuthProvider with ChangeNotifier {
  bool _isLoggedIn = false;
  User? _user;

  bool get isLoggedIn => _isLoggedIn;
  User? get user => _user;

  Future<void> login(String parent_phone, String parent_password) async {
    final url = Uri.parse(ApiConstants.login);

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'parent_phone': parent_phone,
        'parent_password': parent_password,
      }),
    );

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final loginResponse = LoginResponse.fromJson(jsonData);

      if (loginResponse.status) {
        _isLoggedIn = true;
        _user = loginResponse.data?.user;

        // ✅ Save token for future API calls
        await SharedPrefs.saveToken(loginResponse.data!.token);
        notifyListeners();
      } else {
        throw Exception(loginResponse.message);
      }
    } else {
      throw Exception("Login failed: ${response.statusCode}");
    }
  }

  Future<void> logout() async {
    _isLoggedIn = false;
    _user = null;
    await SharedPrefs.clearToken();
    notifyListeners();
  }

  // For checking token on app start
  Future<void> checkLoginStatus() async {
    final token = await SharedPrefs.getToken();
    _isLoggedIn = token != null;
    notifyListeners();
  }

  Future<void> logoutUser(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(
      'auth_token',
    ); // 👈 Make sure you store token here when logging in

    if (token == null) {
      // If no token is found, go straight to login
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
        (route) => false,
      );
      return;
    }

    final response = await http.post(
      Uri.parse(ApiConstants.logout),
      headers: {'Accept': 'application/json', 'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      if (jsonData['status'] == true) {
        // ✅ Logout successful
        await prefs.clear(); // Clear all stored session data

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Logged out successfully')),
        );

        // 🔁 Navigate to login screen and remove all previous routes
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage()),
          (route) => false,
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(jsonData['message'] ?? 'Logout failed')),
        );
      }
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Failed to log out. Try again.')));
    }
  }
}
