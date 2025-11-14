class LeaveRequestHistoryModel {
  final bool status;
  final String message;
  final List<LeaveRequestHistoryData> data;

  LeaveRequestHistoryModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory LeaveRequestHistoryModel.fromJson(Map<String, dynamic> json) {
    return LeaveRequestHistoryModel(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data:
          (json['data'] as List<dynamic>?)
              ?.map((item) => LeaveRequestHistoryData.fromJson(item))
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

class LeaveRequestHistoryData {
  final int id;
  final int studentId;
  final String studentName;
  final int gradeId;
  final int divisionId;
  final int academicYearId;
  final String? startDate;
  final String? endDate;
  final String status;
  final String description;
  final String requestedOn;
  final String approvedBy;
  final String statusColor;

  LeaveRequestHistoryData({
    required this.id,
    required this.studentId,
    required this.studentName,
    required this.gradeId,
    required this.divisionId,
    required this.academicYearId,
    required this.startDate,
    required this.endDate,
    required this.status,
    required this.description,
    required this.requestedOn,
    required this.approvedBy,
    required this.statusColor,
  });

  factory LeaveRequestHistoryData.fromJson(Map<String, dynamic> json) {
    return LeaveRequestHistoryData(
      id: json['id'] ?? 0,
      studentId: json['student_id'] ?? 0,
      studentName: json['student_name'] ?? '',
      gradeId: json['grade_id'] ?? '',
      divisionId: json['division_id'] ?? '',
      academicYearId: json['academic_year_id'] ?? 0,
      startDate: json['start_date'] ?? '',
      endDate: json['end_date'] ?? '',
      status: json['status'] ?? '',
      description: json['description'] ?? '',
      requestedOn: json['requested_on'] ?? 0,
      approvedBy: json['approved_by'] ?? '',
      statusColor: json['status_color'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'student_id': studentId,
      'student_name': studentName,
      'grade_id': gradeId,
      'division_id': divisionId,
      'academic_year_id': academicYearId,
      'start_date': startDate,
      'end_date': endDate,
      'status': status,
      'description': description,
      'requested_on': requestedOn,
      'approved_by': approvedBy,
      'status_color': statusColor,
    };
  }
}
