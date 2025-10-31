class AnecdotalRecordsModel {
  final bool status;
  final String message;
  final List<AnecdotalRecordsData> data;

  AnecdotalRecordsModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory AnecdotalRecordsModel.fromJson(Map<String, dynamic> json) {
    return AnecdotalRecordsModel(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data:
          (json['data'] as List<dynamic>?)
              ?.map((e) => AnecdotalRecordsData.fromJson(e))
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

class AnecdotalRecordsData {
  final int id;
  final int studentId;
  final String studentName;
  final int gradeId;
  final String gradeName;
  final int divisionId;
  final String divisionName;
  final int academicYearId;
  final String academicYear;
  final String incidentDate;
  final String incidentTime;
  final String place;
  final String category;
  final String tag;
  final String behavior;
  final String situation;
  
  final String teacherNote;
  final String followUpAction;
  final String color;
  final String? createdBy;

  AnecdotalRecordsData({
    required this.id,
    required this.studentId,
    required this.studentName,
    required this.gradeId,
    required this.gradeName,
    required this.divisionId,
    required this.divisionName,
    required this.academicYearId,
    required this.academicYear,
    required this.incidentDate,
    required this.incidentTime,
    required this.place,
    required this.category,
    required this.tag,
    required this.behavior,
    required this.situation,
    required this.teacherNote,
    required this.followUpAction,
    required this.color,
    this.createdBy,
  });

  factory AnecdotalRecordsData.fromJson(Map<String, dynamic> json) {
    return AnecdotalRecordsData(
      id: json['id'] ?? 0,
      studentId: json['student_id'] ?? 0,
      studentName: json['student_name'] ?? '',
      gradeId: json['grade_id'] ?? 0,
      gradeName: json['grade_name'] ?? '',
      divisionId: json['division_id'] ?? 0,
      divisionName: json['division_name'] ?? '',
      academicYearId: json['academic_year_id'] ?? 0,
      academicYear: json['academic_year'] ?? '',
      incidentDate: json['incident_date'] ?? '',
      incidentTime: json['incident_time'] ?? '',
      place: json['place'] ?? '',
      category: json['category'] ?? '',
      tag: json['tag'] ?? '',
      behavior: json['behavior'] ?? '',
      situation: json['situation'] ?? '',
      teacherNote: json['teacher_note'] ?? '',
      followUpAction: json['follow_up_action'] ?? '',
      color: json['color'] ?? '',
      createdBy: json['created_by'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'student_id': studentId,
      'student_name': studentName,
      'grade_id': gradeId,
      'grade_name': gradeName,
      'division_id': divisionId,
      'division_name': divisionName,
      'academic_year_id': academicYearId,
      'academic_year': academicYear,
      'incident_date': incidentDate,
      'incident_time': incidentTime,
      'place': place,
      'category': category,
      'tag': tag,
      'behavior': behavior,
      'situation': situation,
      'teacher_note': teacherNote,
      'follow_up_action': followUpAction,
      'color': color,
      'created_by': createdBy,
    };
  }
}
