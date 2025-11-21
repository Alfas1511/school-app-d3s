class DepartmentContactsModel {
  final bool status;
  final String message;
  final List<DepartmentContactsData> data;

  DepartmentContactsModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory DepartmentContactsModel.fromJson(Map<String, dynamic> json) {
    return DepartmentContactsModel(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data:
          (json['data'] as List<dynamic>?)
              ?.map((e) => DepartmentContactsData.fromJson(e))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data.map((e) => e.toJson()).toList(),
    };
  }
}

class DepartmentContactsData {
  final int id;
  final String name;

  DepartmentContactsData({required this.id, required this.name});

  factory DepartmentContactsData.fromJson(Map<String, dynamic> json) {
    return DepartmentContactsData(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name};
  }
}
