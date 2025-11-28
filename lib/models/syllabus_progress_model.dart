class SyllabusProgressModel {
  bool? status;
  String? message;
  List<SyllabusProgressData>? data;

  SyllabusProgressModel({this.status, this.message, this.data});

  factory SyllabusProgressModel.fromJson(Map<String, dynamic> json) {
    return SyllabusProgressModel(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null
          ? List<SyllabusProgressData>.from(
              json['data'].map((x) => SyllabusProgressData.fromJson(x)),
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

class SyllabusProgressData {
  int? id;
  int? gradeId;
  int? divisionId;
  int? subjectId;
  String? subjectName;
  String? color;
  int? completionPercentage;
  int? academicYearId;

  SyllabusProgressData({
    this.id,
    this.gradeId,
    this.divisionId,
    this.subjectId,
    this.subjectName,
    this.color,
    this.completionPercentage,
    this.academicYearId,
  });

  factory SyllabusProgressData.fromJson(Map<String, dynamic> json) {
    return SyllabusProgressData(
      id: json['id'],
      gradeId: json['grade_id'],
      divisionId: json['division_id'],
      subjectId: json['subject_id'],
      subjectName: json['subject'],
      color: json['color'],
      completionPercentage: json['completion_percentage'],
      academicYearId: json['academic_year_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "grade_id": gradeId,
      "division_id": divisionId,
      "subject_id": subjectId,
      "subject": subjectName,
      "color": color,
      "completion_percentage": completionPercentage,
      "academic_year_id": academicYearId,
    };
  }
}
