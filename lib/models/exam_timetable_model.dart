class ExamTimeTableModel {
  bool? status;
  String? message;
  List<ExamData>? data;

  ExamTimeTableModel({this.status, this.message, this.data});

  factory ExamTimeTableModel.fromJson(Map<String, dynamic> json) {
    return ExamTimeTableModel(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null
          ? List<ExamData>.from(json['data'].map((x) => ExamData.fromJson(x)))
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "status": status,
      "message": message,
      "data": data != null ? data!.map((x) => x.toJson()).toList() : [],
    };
  }
}

class ExamData {
  int? id;
  int? examTypeId;
  String? examType;
  int? gradeId;
  String? gradeName;
  int? subjectId;
  String? subject;
  String? examDate;
  String? examTime;
  String? duration;
  String? room;
  int? daysLeft;
  String? subjectColor;

  ExamData({
    this.id,
    this.examTypeId,
    this.examType,
    this.gradeId,
    this.gradeName,
    this.subjectId,
    this.subject,
    this.examDate,
    this.examTime,
    this.duration,
    this.room,
    this.daysLeft,
    this.subjectColor,
  });

  factory ExamData.fromJson(Map<String, dynamic> json) {
    return ExamData(
      id: json['id'],
      examTypeId: json['exam_type_id'],
      examType: json['exam_type'],
      gradeId: json['grade_id'],
      gradeName: json['grade_name'],
      subjectId: json['subject_id'],
      subject: json['subject'],
      examDate: json['exam_date'],
      examTime: json['exam_time'],
      duration: json['duration'],
      room: json['room'],
      daysLeft: json['days_left'],
      subjectColor: json['subject_color'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "exam_type_id": examTypeId,
      "exam_type": examType,
      "grade_id": gradeId,
      "grade_name": gradeName,
      "subject_id": subjectId,
      "subject": subject,
      "exam_date": examDate,
      "exam_time": examTime,
      "duration": duration,
      "room": room,
      "days_left": daysLeft,
      "subject_color": subjectColor,
    };
  }
}
