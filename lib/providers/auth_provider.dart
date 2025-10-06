// // lib/providers/auth_provider.dart
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import '../core/services/api_service.dart';
// import '../core/constants/api_constants.dart';
// import '../core/utils/storage_helper.dart';
// import '../models/user_model.dart';

// class AuthProvider extends ChangeNotifier {
//   final ApiService _apiService = ApiService();

//   bool _isLoggedIn = false;
//   String? _token;
//   UserModel? _user;

//   bool get isLoggedIn => _isLoggedIn;
//   UserModel? get user => _user;

//   Future<void> login(String phone, String password) async {
//     try {
//       final response = await _apiService.postRequest(
//         ApiConstants.login,
//         {"phone": phone, "password": password},
//       );

//       final token = response['data']['token'];
//       final userData = response['data']['user'];

//       _token = token;
//       _user = UserModel.fromJson(userData);

//       await StorageHelper.saveToken(token);
//       await StorageHelper.saveUser(jsonEncode(userData));

//       _isLoggedIn = true;
//       notifyListeners();
//     } catch (e) {
//       throw Exception("Login failed: ${e.toString()}");
//     }
//   }

//   Future<void> logout() async {
//     await StorageHelper.clearToken();
//     _token = null;
//     _user = null;
//     _isLoggedIn = false;
//     notifyListeners();
//   }

//   Future<void> checkLoginStatus() async {
//     final token = await StorageHelper.getToken();
//     final userJson = await StorageHelper.getUser();

//     if (token != null && userJson != null) {
//       _token = token;
//       _user = UserModel.fromJson(jsonDecode(userJson));
//       _isLoggedIn = true;
//     } else {
//       _isLoggedIn = false;
//     }
//     notifyListeners();
//   }
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../core/constants/api_constants.dart';
import '../models/login_response.dart';
import '../core/utils/shared_prefs.dart';

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
}
