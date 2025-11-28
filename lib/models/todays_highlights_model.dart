class TodaysHighlightsModel {
  final bool status;
  final String message;
  final List<TodaysHighlightsData> data;

  TodaysHighlightsModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory TodaysHighlightsModel.fromJson(Map<String, dynamic> json) {
    return TodaysHighlightsModel(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data:
          (json['data'] as List<dynamic>?)
              ?.map((item) => TodaysHighlightsData.fromJson(item))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data.map((item) => item.toJson()).toList(),
    };
  }
}

class TodaysHighlightsData {
  final int id;
  final int typeId;
  final String typeName;
  final String title;
  final String description;
  final int academicYearId;
  final String academicYear;
  final String links;
  final int studentId;
  final String studentName;
  final String color;
  final String createdAt;

  TodaysHighlightsData({
    required this.id,
    required this.typeId,
    required this.typeName,
    required this.title,
    required this.description,
    required this.academicYearId,
    required this.academicYear,
    required this.links,
    required this.studentId,
    required this.studentName,
    required this.color,
    required this.createdAt,
  });

  factory TodaysHighlightsData.fromJson(Map<String, dynamic> json) {
    return TodaysHighlightsData(
      id: json['id'] ?? 0,
      typeId: json['type_id'] ?? 0,
      typeName: json['type_name'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      academicYearId: json['academic_year_id'] ?? 0,
      academicYear: json['academic_year'] ?? '',
      links: json['links'] ?? '',
      studentId: json['student_id'] ?? 0,
      studentName: json['student_name'],
      color: json['color'],
      createdAt: json['created_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type_id': typeId,
      'type_name': typeName,
      'title': title,
      'description': description,
      'academic_year_id': academicYearId,
      'academic_year': academicYear,
      'links': links,
      'student_id': studentId,
      'student_name': studentName,
      'color': color,
      'created_at': createdAt,
    };
  }
}
