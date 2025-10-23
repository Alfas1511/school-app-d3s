// lib/core/constants/api_constants.dart
class ApiConstants {
  // static const String baseUrl = "http://127.0.0.1:8000/api";
  static const String baseUrl = "http://10.0.2.2:8000/api";
  // static const String baseUrl =
  //     "https://mediumorchid-falcon-472579.hostingersite.com/api";

  // Endpoints
  static const String login = "$baseUrl/parent/login";
  static const String logout = "$baseUrl/parent/logout";
  static const String parentProfile = "$baseUrl/parent/parent-profile";
  static const String studentList = "$baseUrl/parent/students-list";
  static const String studentDetails = "$baseUrl/parent/student-details";
  static const String studentAttendance = "$baseUrl/parent/student-attendance";

  static const String gradeStudyMaterials =
      "$baseUrl/parent/grade-study-materials";

  static const String studentBusInformation =
      "$baseUrl/parent/student-bus-information";
}
