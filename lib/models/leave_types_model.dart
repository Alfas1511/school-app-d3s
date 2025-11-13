class LeaveTypesModel {
  final bool status;
  final String message;
  final List<LeaveTypesData> data;

  LeaveTypesModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory LeaveTypesModel.fromJson(Map<String, dynamic> json) {
    return LeaveTypesModel(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data:
          (json['data'] as List<dynamic>?)
              ?.map((e) => LeaveTypesData.fromJson(e))
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

class LeaveTypesData {
  final int id;
  final String leaveType;

  LeaveTypesData({required this.id, required this.leaveType});

  factory LeaveTypesData.fromJson(Map<String, dynamic> json) {
    return LeaveTypesData(
      id: json['id'] ?? 0,
      leaveType: json['leave_type'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'leave_type': leaveType};
  }
}
