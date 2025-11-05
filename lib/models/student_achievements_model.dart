class StudentAchievementsModel {
  final bool status;
  final String message;
  final List<StudentAchievement> data;

  StudentAchievementsModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory StudentAchievementsModel.fromJson(Map<String, dynamic> json) {
    return StudentAchievementsModel(
      status: json['status'] ?? false,
      message: json['message'] ?? "",
      data:
          (json['data'] as List<dynamic>?)
              ?.map((e) => StudentAchievement.fromJson(e))
              .toList() ??
          [],
    );
  }
}

class StudentAchievement {
  final int id;
  final int studentId;
  final String studentName;
  final int eventId;
  final String eventName;
  final int competitionItemId;
  final String competitionItemName;
  final int achievementTypeId;
  final String achievementTypeName;
  final int achievementLevelId;
  final String achievementLevelName;
  final int achievementCategoryId;
  final String achievementCategory;
  final int academicYearId;
  final String academicYear;
  final String position;
  final String date;
  final String description;

  StudentAchievement({
    required this.id,
    required this.studentId,
    required this.studentName,
    required this.eventId,
    required this.eventName,
    required this.competitionItemId,
    required this.competitionItemName,
    required this.achievementTypeId,
    required this.achievementTypeName,
    required this.achievementLevelId,
    required this.achievementLevelName,
    required this.achievementCategoryId,
    required this.achievementCategory,
    required this.academicYearId,
    required this.academicYear,
    required this.position,
    required this.date,
    required this.description,
  });

  factory StudentAchievement.fromJson(Map<String, dynamic> json) {
    return StudentAchievement(
      id: json['id'] ?? 0,
      studentId: json['student_id'] ?? 0,
      studentName: json['student_name'] ?? "",
      eventId: json['event_id'] ?? 0,
      eventName: json['event_name'] ?? "",
      competitionItemId: json['competition_item_id'] ?? 0,
      competitionItemName: json['competition_item_name'] ?? "",
      achievementTypeId: json['achievement_type_id'] ?? 0,
      achievementTypeName: json['achievement_type_name'] ?? "",
      achievementLevelId: json['achievement_level_id'] ?? 0,
      achievementLevelName: json['achievement_level_name'] ?? "",
      achievementCategoryId: json['achievement_category_id'] ?? 0,
      achievementCategory: json['achievement_category'] ?? "",
      academicYearId: json['academic_year_id'] ?? 0,
      academicYear: json['academic_year'] ?? "",
      position: json['position'] ?? "",
      date: json['date'] ?? "",
      description: json['description'] ?? "",
    );
  }
}
