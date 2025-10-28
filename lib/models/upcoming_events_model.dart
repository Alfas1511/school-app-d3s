class UpcomingEventsModel {
  final bool status;
  final String message;
  final List<EventData> data;

  UpcomingEventsModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory UpcomingEventsModel.fromJson(Map<String, dynamic> json) {
    return UpcomingEventsModel(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data:
          (json['data'] as List<dynamic>?)
              ?.map((item) => EventData.fromJson(item))
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

class EventData {
  final int id;
  final String eventName;
  final String eventDate;
  final String venue;

  EventData({
    required this.id,
    required this.eventName,
    required this.eventDate,
    required this.venue,
  });

  factory EventData.fromJson(Map<String, dynamic> json) {
    return EventData(
      id: json['id'] ?? 0,
      eventName: json['event_name'] ?? '',
      eventDate: json['event_date'] ?? '',
      venue: json['venue'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'event_name': eventName,
      'event_date': eventDate,
      'venue': venue,
    };
  }
}
