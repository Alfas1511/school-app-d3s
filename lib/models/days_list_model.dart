class DaysListModel {
  final bool status;
  final String message;
  final List<DaysListData> data;

  DaysListModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory DaysListModel.fromJson(Map<String, dynamic> json) {
    return DaysListModel(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data:
          (json['data'] as List<dynamic>?)
              ?.map((e) => DaysListData.fromJson(e))
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

class DaysListData {
  final String day;

  DaysListData({required this.day});

  factory DaysListData.fromJson(Map<String, dynamic> json) {
    return DaysListData(day: json['day'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {'day': day};
  }
}
