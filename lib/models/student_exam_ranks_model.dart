class StudentExamRanksModel {
  bool? status;
  String? message;
  List<StudentExamRankData>? data;

  StudentExamRanksModel({this.status, this.message, this.data});

  StudentExamRanksModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = List<StudentExamRankData>.from(
        json['data'].map((item) => StudentExamRankData.fromJson(item)),
      );
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data?.map((e) => e.toJson()).toList(),
    };
  }
}

class StudentExamRankData {
  int? id;
  int? studentId;
  String? studentName;
  int? gradeId;
  String? gradeName;
  int? divisionId;
  String? divisionName;
  int? subjectId;
  String? subjectName;
  int? rank;

  StudentExamRankData({
    this.id,
    this.studentId,
    this.studentName,
    this.gradeId,
    this.gradeName,
    this.divisionId,
    this.divisionName,
    this.subjectId,
    this.subjectName,
    this.rank,
  });

  StudentExamRankData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    studentId = json['student_id'];
    studentName = json['student_name'];
    gradeId = json['grade_id'];
    gradeName = json['grade_name'];
    divisionId = json['division_id'];
    divisionName = json['division_name'];
    subjectId = json['subject_id'];
    subjectName = json['subject_name'];
    rank = int.tryParse(json['rank'].toString());
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
      'subject_id': subjectId,
      'subject_name': subjectName,
      'rank': rank,
    };
  }
}
