class EventsListModel {
  final bool status;
  final String message;
  final List<EventsListData> data;

  EventsListModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory EventsListModel.fromJson(Map<String, dynamic> json) {
    return EventsListModel(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data:
          (json['data'] as List<dynamic>?)
              ?.map((e) => EventsListData.fromJson(e))
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

class EventsListData {
  final int id;
  final String eventName;
  final String eventDate;
  final int academicYearId;
  final String academicYear;

  EventsListData({
    required this.id,
    required this.eventName,
    required this.eventDate,
    required this.academicYearId,
    required this.academicYear,
  });

  factory EventsListData.fromJson(Map<String, dynamic> json) {
    return EventsListData(
      id: json['id'] ?? 0,
      eventName: json['event_name'] ?? '',
      eventDate: json['event_date'] ?? '',
      academicYearId: json['academic_year_id'] ?? 0,
      academicYear: json['academic_year'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'event_name': eventName,
      'event_date': eventDate,
      'academic_year_id': academicYearId,
      'academic_year': academicYear,
    };
  }
}
