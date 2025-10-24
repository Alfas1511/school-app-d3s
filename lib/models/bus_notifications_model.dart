class BusNotificationsModel {
  final bool status;
  final String message;
  final List<BusNotificationData> data;

  BusNotificationsModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory BusNotificationsModel.fromJson(Map<String, dynamic> json) {
    return BusNotificationsModel(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data: json['data'] != null
          ? List<BusNotificationData>.from(
              json['data'].map((x) => BusNotificationData.fromJson(x)),
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

class BusNotificationData {
  final int id;
  final int studentId;
  final String studentName;
  final String title;
  final String description;
  final String type;

  BusNotificationData({
    required this.id,
    required this.studentId,
    required this.studentName,
    required this.title,
    required this.description,
    required this.type,
  });

  factory BusNotificationData.fromJson(Map<String, dynamic> json) {
    return BusNotificationData(
      id: json['id'] ?? 0,
      studentId: json['student_id'] ?? 0,
      studentName: json['student_name'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      type: json['type'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'student_id': studentId,
    'student_name': studentName,
    'title': title,
    'description': description,
    'type': type,
  };
}
