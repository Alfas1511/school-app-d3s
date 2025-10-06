class LoginResponse {
  final bool status;
  final String message;
  final UserData? data;

  LoginResponse({required this.status, required this.message, this.data});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data: json['data'] != null ? UserData.fromJson(json['data']) : null,
    );
  }
}

class UserData {
  final User user;
  final String token;
  final String tokenType;

  UserData({required this.user, required this.token, required this.tokenType});

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      user: User.fromJson(json['user']),
      token: json['token'],
      tokenType: json['token_type'],
    );
  }
}

class User {
  final int id;
  final String parentPhone;
  final bool parentStatus;
  final String createdAt;
  final String updatedAt;
  final int createdBy;

  User({
    required this.id,
    required this.parentPhone,
    required this.parentStatus,
    required this.createdAt,
    required this.updatedAt,
    required this.createdBy,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      parentPhone: json['parent_phone'],
      parentStatus: json['parent_status'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      createdBy: json['created_by'],
    );
  }
}
