class BusRecentTripsModel {
  final bool status;
  final String message;
  final List<BusRecentTripData> data;

  BusRecentTripsModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory BusRecentTripsModel.fromJson(Map<String, dynamic> json) {
    return BusRecentTripsModel(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data: json['data'] != null
          ? List<BusRecentTripData>.from(
              json['data'].map((x) => BusRecentTripData.fromJson(x)),
            )
          : [],
    );
  }

  Map<String, dynamic> toJson() => {
    'status': status,
    'message': message,
    'data': List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class BusRecentTripData {
  final int id;
  final int studentId;
  final String studentName;
  final String date;
  final String startTime;
  final String? endTime;
  final String status;

  BusRecentTripData({
    required this.id,
    required this.studentId,
    required this.studentName,
    required this.date,
    required this.startTime,
    this.endTime,
    required this.status,
  });

  factory BusRecentTripData.fromJson(Map<String, dynamic> json) {
    return BusRecentTripData(
      id: json['id'] ?? 0,
      studentId: json['student_id'] ?? 0,
      studentName: json['student_name'] ?? '',
      date: json['date'] ?? '',
      startTime: json['start_time'] ?? '',
      endTime: json['end_time'],
      status: json['status'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'student_id': studentId,
    'student_name': studentName,
    'date': date,
    'start_time': startTime,
    'end_time': endTime,
    'status': status,
  };
}
