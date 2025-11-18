class StudentExamResultsModel {
  bool? status;
  String? message;
  List<StudentExamData>? data;

  StudentExamResultsModel({this.status, this.message, this.data});

  factory StudentExamResultsModel.fromJson(Map<String, dynamic> json) {
    return StudentExamResultsModel(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null
          ? List<StudentExamData>.from(
              json['data'].map((x) => StudentExamData.fromJson(x)),
            )
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "status": status,
      "message": message,
      "data": data?.map((x) => x.toJson()).toList(),
    };
  }
}

class StudentExamData {
  int? id;
  int? studentId;
  String? studentName;
  int? gradeId;
  String? gradeName;
  int? divisionId;
  String? divisionName;
  int? subjectId;
  String? subjectName;
  int? examTypeId;
  String? examType;
  int? maxMarks;
  int? obtainedMarks;
  String? gradeLetter;
  String? resultStatus;
  String? subjectColor;

  StudentExamData({
    this.id,
    this.studentId,
    this.studentName,
    this.gradeId,
    this.gradeName,
    this.divisionId,
    this.divisionName,
    this.subjectId,
    this.subjectName,
    this.examTypeId,
    this.examType,
    this.maxMarks,
    this.obtainedMarks,
    this.gradeLetter,
    this.resultStatus,
    this.subjectColor,
  });

  factory StudentExamData.fromJson(Map<String, dynamic> json) {
    return StudentExamData(
      id: json['id'],
      studentId: json['student_id'],
      studentName: json['student_name'],
      gradeId: json['grade_id'],
      gradeName: json['grade_name'],
      divisionId: json['division_id'],
      divisionName: json['division_name'],
      subjectId: json['subject_id'],
      subjectName: json['subject_name'],
      examTypeId: json['exam_type_id'],
      examType: json['exam_type'],
      maxMarks: json['max_marks'],
      obtainedMarks: json['obtained_marks'],
      gradeLetter: json['grade_letter'],
      resultStatus: json['result_status'],
      subjectColor: json['subject_color'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "student_id": studentId,
      "student_name": studentName,
      "grade_id": gradeId,
      "grade_name": gradeName,
      "division_id": divisionId,
      "division_name": divisionName,
      "subject_id": subjectId,
      "subject_name": subjectName,
      "exam_type_id": examTypeId,
      "exam_type": examType,
      "max_marks": maxMarks,
      "obtained_marks": obtainedMarks,
      "grade_letter": gradeLetter,
      "result_status": resultStatus,
      "subject_color": subjectColor,
    };
  }
}
