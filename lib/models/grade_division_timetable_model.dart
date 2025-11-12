class GradeDivisionTimetableModel {
  final bool status;
  final String message;
  final List<GradeDivisionTimetableData> data;

  GradeDivisionTimetableModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory GradeDivisionTimetableModel.fromJson(Map<String, dynamic> json) {
    return GradeDivisionTimetableModel(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data:
          (json['data'] as List<dynamic>?)
              ?.map((e) => GradeDivisionTimetableData.fromJson(e))
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

class GradeDivisionTimetableData {
  final int id;
  final int academicYearId;
  final String academicYear;
  final int gradeId;
  final String gradeName;
  final int divisionId;
  final String divisionName;
  final String startTime;
  final String endTime;
  final String day;
  final int subjectTeacherId;
  final String subjectTeacher;
  final int classSubjectId;
  final String classSubjectName;

  GradeDivisionTimetableData({
    required this.id,
    required this.academicYearId,
    required this.academicYear,
    required this.gradeId,
    required this.gradeName,
    required this.divisionId,
    required this.divisionName,
    required this.startTime,
    required this.endTime,
    required this.day,
    required this.subjectTeacherId,
    required this.subjectTeacher,
    required this.classSubjectId,
    required this.classSubjectName,
  });

  factory GradeDivisionTimetableData.fromJson(Map<String, dynamic> json) {
    return GradeDivisionTimetableData(
      id: json['id'] ?? 0,
      academicYearId: json['academic_year_id'] ?? 0,
      academicYear: json['academic_year'] ?? '',
      gradeId: json['grade_id'] ?? 0,
      gradeName: json['grade_name'] ?? '',
      divisionId: json['division_id'] ?? 0,
      divisionName: json['division_name'] ?? '',
      startTime: json['start_time'] ?? '',
      endTime: json['end_time'] ?? '',
      day: json['day'] ?? '',
      subjectTeacherId: json['subject_teacher_id'] ?? 0,
      subjectTeacher: json['subject_teacher'] ?? '',
      classSubjectId: json['class_subject_id'] ?? 0,
      classSubjectName: json['class_subject_name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'academic_year_id': academicYearId,
      'academic_year': academicYear,
      'grade_id': gradeId,
      'gradeName': gradeName,
      'division_id': divisionId,
      'division_name': divisionName,
      'start_time': startTime,
      'end_time': endTime,
      'subject_teacher_id': subjectTeacherId,
      'subject_teacher': subjectTeacher,
      'class_subject_id': classSubjectId,
      'class_subject_name': classSubjectName,
    };
  }
}
