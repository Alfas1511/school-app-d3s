class SchoolContactsModel {
  final bool status;
  final String message;
  final List<ContactData> data;

  SchoolContactsModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory SchoolContactsModel.fromJson(Map<String, dynamic> json) {
    return SchoolContactsModel(
      status: json['status'] ?? false,
      message: json['message'] ?? "",
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => ContactData.fromJson(e))
              .toList() 
          ?? [],
    );
  }
}

class ContactData {
  final int id;
  final String name;
  final String phone;
  final String email;
  final String days;
  final String time;

  ContactData({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.days,
    required this.time,
  });

  factory ContactData.fromJson(Map<String, dynamic> json) {
    return ContactData(
      id: json['id'] ?? 0,
      name: json['name'] ?? "",
      phone: json['phone'] ?? "",
      email: json['email'] ?? "",
      days: json['days'] ?? "",
      time: json['time'] ?? "",
    );
  }
}
