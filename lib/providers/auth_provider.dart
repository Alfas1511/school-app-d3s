// lib/providers/auth_provider.dart
import 'dart:convert';
import 'package:flutter/material.dart';
import '../core/services/api_service.dart';
import '../core/constants/api_constants.dart';
import '../core/utils/storage_helper.dart';
import '../models/user_model.dart';

class AuthProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();

  bool _isLoggedIn = false;
  String? _token;
  UserModel? _user;

  bool get isLoggedIn => _isLoggedIn;
  UserModel? get user => _user;

  Future<void> login(String phone, String password) async {
    try {
      final response = await _apiService.postRequest(
        ApiConstants.login,
        {"phone": phone, "password": password},
      );

      final token = response['data']['token'];
      final userData = response['data']['user'];

      _token = token;
      _user = UserModel.fromJson(userData);

      await StorageHelper.saveToken(token);
      await StorageHelper.saveUser(jsonEncode(userData));

      _isLoggedIn = true;
      notifyListeners();
    } catch (e) {
      throw Exception("Login failed: ${e.toString()}");
    }
  }

  Future<void> logout() async {
    await StorageHelper.clearToken();
    _token = null;
    _user = null;
    _isLoggedIn = false;
    notifyListeners();
  }

  Future<void> checkLoginStatus() async {
    final token = await StorageHelper.getToken();
    final userJson = await StorageHelper.getUser();

    if (token != null && userJson != null) {
      _token = token;
      _user = UserModel.fromJson(jsonDecode(userJson));
      _isLoggedIn = true;
    } else {
      _isLoggedIn = false;
    }
    notifyListeners();
  }
}
