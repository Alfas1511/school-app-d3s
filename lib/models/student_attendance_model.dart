class StudentAttendanceModel {
  final bool status;
  final String message;
  final StudentAttendanceData? data;

  StudentAttendanceModel({
    required this.status,
    required this.message,
    this.data,
  });

  factory StudentAttendanceModel.fromJson(Map<String, dynamic> json) {
    return StudentAttendanceModel(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data: json['data'] != null
          ? StudentAttendanceData.fromJson(json['data'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {'status': status, 'message': message, 'data': data?.toJson()};
  }
}

class StudentAttendanceData {
  final String studentName;
  final int presentCount;
  final int absentCount;
  final int lateCount;
  final List<AttendanceDetail> attendanceDetails;
  final List<Holidays> holidays;

  StudentAttendanceData({
    required this.studentName,
    required this.presentCount,
    required this.absentCount,
    required this.lateCount,
    required this.attendanceDetails,
    required this.holidays,
  });

  factory StudentAttendanceData.fromJson(Map<String, dynamic> json) {
    return StudentAttendanceData(
      studentName: json['student_name'] ?? '',
      presentCount: json['present_count'] ?? 0,
      absentCount: json['absent_count'] ?? 0,
      lateCount: json['late_count'] ?? 0,
      attendanceDetails:
          json['attendance_details'] != null &&
              json['attendance_details'] is List
          ? (json['attendance_details'] as List)
                .map((e) => AttendanceDetail.fromJson(e))
                .toList()
          : [],
      holidays: json['holidays'] != null && json['holidays'] is List
          ? (json['holidays'] as List).map((e) => Holidays.fromJson(e)).toList()
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'student_name': studentName,
      'present_count': presentCount,
      'absent_count': absentCount,
      'late_count': lateCount,
      'attendance_details': attendanceDetails
          .map((item) => item.toJson())
          .toList(),
      'holidays': holidays.map((item) => item.toJson()).toList(),
    };
  }
}

class AttendanceDetail {
  final int id;
  final String attendanceStatus;
  final String attendanceDate;
  final String attendanceNote;
  final String createdAt;
  final String updatedAt;
  final String color;

  AttendanceDetail({
    required this.id,
    required this.attendanceStatus,
    required this.attendanceDate,
    required this.attendanceNote,
    required this.createdAt,
    required this.updatedAt,
    required this.color,
  });

  factory AttendanceDetail.fromJson(Map<String, dynamic> json) {
    return AttendanceDetail(
      id: json['id'] ?? 0,
      attendanceStatus: json['attendance_status'] ?? '',
      attendanceDate: json['attendance_date'] ?? '',
      attendanceNote: json['attendance_note'] ?? '',
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      color: json['color'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'attendance_status': attendanceStatus,
      'attendance_date': attendanceDate,
      'attendance_note': attendanceNote,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'color': color,
    };
  }
}

class Holidays {
  final int id;
  final String holidayType;
  final String holidayName;
  final String holidayDate;
  final String holidayDescription;

  Holidays({
    required this.id,
    required this.holidayType,
    required this.holidayName,
    required this.holidayDate,
    required this.holidayDescription,
  });

  factory Holidays.fromJson(Map<String, dynamic> json) {
    return Holidays(
      id: json['id'] ?? 0,
      holidayType: json['holiday_type'] ?? '',
      holidayName: json['holiday_name'] ?? '',
      holidayDate: json['holiday_date'] ?? '',
      holidayDescription: json['holiday_description'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'holiday_type': holidayType,
      'holiday_name': holidayName,
      'holiday_date': holidayDate,
      'holiday_description': holidayDescription,
    };
  }
}
