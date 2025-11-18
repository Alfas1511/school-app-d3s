class StudentCertificatesModel {
  final bool status;
  final String message;
  final List<StudentCertificateData> data;

  StudentCertificatesModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory StudentCertificatesModel.fromJson(Map<String, dynamic> json) {
    return StudentCertificatesModel(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data:
          (json['data'] as List<dynamic>?)
              ?.map((e) => StudentCertificateData.fromJson(e))
              .toList() ??
          [],
    );
  }
}

class StudentCertificateData {
  final int id;
  final int studentId;
  final String studentName;
  final int eventId;
  final String eventName;
  final int competitionId;
  final String competitionName;
  final int competitionItemId;
  final String competitionItemName;
  final int participationCategoryId;
  final String participationCategoryName;
  final int academicYearId;
  final String academicYear;
  final String date;
  final int status;
  final dynamic file;

  StudentCertificateData({
    required this.id,
    required this.studentId,
    required this.studentName,
    required this.eventId,
    required this.eventName,
    required this.competitionId,
    required this.competitionName,
    required this.competitionItemId,
    required this.competitionItemName,
    required this.participationCategoryId,
    required this.participationCategoryName,
    required this.academicYearId,
    required this.academicYear,
    required this.date,
    required this.status,
    required this.file,
  });

  factory StudentCertificateData.fromJson(Map<String, dynamic> json) {
    return StudentCertificateData(
      id: json['id'] ?? 0,
      studentId: json['student_id'] ?? 0,
      studentName: json['student_name'] ?? '',
      eventId: json['event_id'] ?? 0,
      eventName: json['event_name'] ?? '',
      competitionId: json['competition_id'] ?? 0,
      competitionName: json['competition_name'] ?? '',
      competitionItemId: json['competition_item_id'] ?? 0,
      competitionItemName: json['competition_item_name'] ?? '',
      participationCategoryId: json['participation_category_id'] ?? 0,
      participationCategoryName: json['participation_category_name'] ?? '',
      academicYearId: json['academic_year_id'] ?? 0,
      academicYear: json['academic_year'] ?? '',
      date: json['date'] ?? '',
      status: json['status'] ?? 0,
      file: json['file'],
    );
  }
}
