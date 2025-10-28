class EventImagesModel {
  final bool status;
  final String message;
  final List<EventImageData> data;

  EventImagesModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory EventImagesModel.fromJson(Map<String, dynamic> json) {
    return EventImagesModel(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data:
          (json['data'] as List<dynamic>?)
              ?.map((e) => EventImageData.fromJson(e))
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

class EventImageData {
  final int id;
  final int eventId;
  final String eventName;
  final int academicYearId;
  final String academicYear;
  final String imageUrl;
  final String date;

  EventImageData({
    required this.id,
    required this.eventId,
    required this.eventName,
    required this.academicYearId,
    required this.academicYear,
    required this.imageUrl,
    required this.date,
  });

  factory EventImageData.fromJson(Map<String, dynamic> json) {
    return EventImageData(
      id: json['id'] ?? 0,
      eventId: json['event_id'] ?? 0,
      eventName: json['event_name'] ?? '',
      academicYearId: json['academic_year_id'] ?? 0,
      academicYear: json['academic_year'] ?? '',
      imageUrl: json['image_url'] ?? '',
      date: json['date'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'event_id': eventId,
      'event_name': eventName,
      'academic_year_id': academicYearId,
      'academic_year': academicYear,
      'image_url': imageUrl,
      'date': date,
    };
  }
}
