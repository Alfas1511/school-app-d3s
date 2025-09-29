// // lib/models/user_model.dart
// class UserModel {
//   final int id;
//   final String name;
//   final String email;
//   final String phone;

//   UserModel({
//     required this.id,
//     required this.name,
//     required this.email,
//     required this.phone,
//   });

//   factory UserModel.fromJson(Map<String, dynamic> json) {
//     return UserModel(
//       id: json['id'],
//       name: json['name'],
//       email: json['email'] ?? '',
//       phone: json['phone'] ?? '',
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
    final user = json['data']['user'];
    return UserModel(
      id: user['id'],
      parentPhone: user['parent_phone'],
      parentStatus: user['parent_status'],
      token: json['data']['token'], // 👈 store token here
    );
  }
}
