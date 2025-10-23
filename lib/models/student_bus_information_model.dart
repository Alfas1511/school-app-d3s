class StudentBusInformationModel {
  final bool status;
  final String message;
  final StudentBusData data;

  StudentBusInformationModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory StudentBusInformationModel.fromJson(Map<String, dynamic> json) {
    return StudentBusInformationModel(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data: StudentBusData.fromJson(json['data'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() => {
    'status': status,
    'message': message,
    'data': data.toJson(),
  };
}

class StudentBusData {
  final int id;
  final int studentId;
  final String studentName;
  final int busId;
  final String busNumber;
  final int tripId;
  final String tripName;
  final int driverId;
  final String driverName;
  final String contactNumber;
  final int academicYearId;
  final String academicYear;

  StudentBusData({
    required this.id,
    required this.studentId,
    required this.studentName,
    required this.busId,
    required this.busNumber,
    required this.tripId,
    required this.tripName,
    required this.driverId,
    required this.driverName,
    required this.contactNumber,
    required this.academicYearId,
    required this.academicYear,
  });

  factory StudentBusData.fromJson(Map<String, dynamic> json) {
    return StudentBusData(
      id: json['id'] ?? 0,
      studentId: json['student_id'] ?? 0,
      studentName: json['student_name'] ?? '',
      busId: json['bus_id'] ?? 0,
      busNumber: json['bus_number'] ?? '',
      tripId: json['trip_id'] ?? 0,
      tripName: json['trip_name'] ?? '',
      driverId: json['driver_id'] ?? 0,
      driverName: json['driver_name'] ?? '',
      contactNumber: json['contact_number'] ?? '',
      academicYearId: json['academic_year_id'] ?? 0,
      academicYear: json['academic_year'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'student_id': studentId,
    'student_name': studentName,
    'bus_id': busId,
    'bus_number': busNumber,
    'trip_id': tripId,
    'trip_name': tripName,
    'driver_id': driverId,
    'driver_name': driverName,
    'contact_number': contactNumber,
    'academic_year_id': academicYearId,
    'academic_year': academicYear,
  };
}
