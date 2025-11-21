class SchoolDepartmentsModel {
  final bool status;
  final String message;
  final List<SchoolDepartmentsData> data;

  SchoolDepartmentsModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory SchoolDepartmentsModel.fromJson(Map<String, dynamic> json) {
    return SchoolDepartmentsModel(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data:
          (json['data'] as List<dynamic>?)
              ?.map((e) => SchoolDepartmentsData.fromJson(e))
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

class SchoolDepartmentsData {
  final int id;
  final String departmentName;
  final String departmentCategory;

  SchoolDepartmentsData({
    required this.id,
    required this.departmentName,
    required this.departmentCategory,
  });

  factory SchoolDepartmentsData.fromJson(Map<String, dynamic> json) {
    return SchoolDepartmentsData(
      id: json['id'] ?? 0,
      departmentName: json['department_name'] ?? '',
      departmentCategory: json['department_category'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'department_name': departmentName,
      'department_category': departmentCategory,
    };
  }
}
