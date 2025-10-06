// lib/core/constants/api_constants.dart
class ApiConstants {
  // static const String baseUrl = "http://127.0.0.1:8000/api";
  // static const String baseUrl = "http://10.0.2.2:8000/api";
  static const String baseUrl =
      "https://mediumorchid-falcon-472579.hostingersite.com/api";

  // Endpoints
  static const String login = "$baseUrl/parent/login";
  static const String logout = "$baseUrl/logout";
  static const String user = "$baseUrl/user";
}
