// class UserModel {
//   final int id;
//   final String parentPhone;
//   final bool parentStatus;
//   final String token;

//   UserModel({
//     required this.id,
//     required this.parentPhone,
//     required this.parentStatus,
//     required this.token,
//   });

//   factory UserModel.fromJson(Map<String, dynamic> json) {
//     final user = json['data']['user'];
//     return UserModel(
//       id: user['id'],
//       parentPhone: user['parent_phone'],
//       parentStatus: user['parent_status'],
//       token: json['data']['token'],
//     );
//   }
// }

class UserModel {
  final int id;
  final String parentPhone;
  final bool parentStatus;
  final String token;

  UserModel({
    required this.id,
    required this.parentPhone,
    required this.parentStatus,
    required this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    final user = json['data']?['user'] ?? {};

    return UserModel(
      id: user['id'] ?? 0,
      parentPhone: user['parent_phone'] ?? '',
      parentStatus: user['parent_status'] ?? false,
      token: json['data']?['token'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'parent_phone': parentPhone,
      'parent_status': parentStatus,
      'token': token,
    };
  }
}
