// lib/core/services/api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:school_app/providers/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:school_app/main.dart';

class ApiService {
  Future<Map<String, dynamic>> postRequest(
    String url,
    Map<String, dynamic> body, {
    String? token,
  }) async {
    final response = await http.post(
      Uri.parse(url),
      body: jsonEncode(body),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        if (token != null) "Authorization": "Bearer $token",
      },
    );
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> getRequest(String url, {String? token}) async {
    final response = await http.get(
      Uri.parse(url),
      headers: {
        "Content-Type": "application/json",
        if (token != null) "Authorization": "Bearer $token",
      },
    );
    return _handleResponse(response);
  }

  // Map<String, dynamic> _handleResponse(http.Response response) {
  //   final body = jsonDecode(response.body);

  //   if (response.statusCode >= 200 && response.statusCode < 300) {
  //     return body;
  //   } else {
  //     throw Exception(body['message'] ?? "Error: ${response.statusCode}");
  //   }
  // }

  Map<String, dynamic> _handleResponse(http.Response response) {
    final body = jsonDecode(response.body);

    // ---- AUTO LOGOUT ----
    if (response.statusCode == 401 ||
        body['message'] == "Unauthenticated." ||
        body['message'] == "Token Invalid") {
      final context = navigatorKey.currentContext;
      if (context != null) {
        Provider.of<AuthProvider>(context, listen: false).forceLogout();
      }

      throw Exception("Session expired. Please login again.");
    }

    // ---- SUCCESS ----
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return body;
    }

    throw Exception(body['message'] ?? "Error: ${response.statusCode}");
  }
}
