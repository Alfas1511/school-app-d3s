// lib/core/constants/api_constants.dart
class ApiConstants {
  // static const String baseUrl = "http://127.0.0.1:8000/api"; // Localhost
  // static const String baseUrl = "http://192.168.1.19:8000/api"; // Physical Device
  static const String baseUrl = "http://10.0.2.2:8000/api"; // Android Emulator
  // static const String baseUrl =
  // "https://mediumorchid-falcon-472579.hostingersite.com/api"; // Server

  // Endpoints
  static const String login = "$baseUrl/parent/login";
  static const String changePassword = "$baseUrl/parent/change-password";
  static const String logout = "$baseUrl/parent/logout";
  static const String parentProfile = "$baseUrl/parent/parent-profile";
  static const String studentList = "$baseUrl/parent/students-list";
  static const String studentDetails = "$baseUrl/parent/student-details";
  static const String studentAttendance = "$baseUrl/parent/student-attendance";

  static const String homeImportantUpdates =
      "$baseUrl/parent/important-updates";

  static const String academicImportantUpdates =
      "$baseUrl/parent/academic-important-updates";

  static const String gradeStudyMaterials =
      "$baseUrl/parent/grade-study-materials";

  // Bus Information Endpoints
  static const String studentBusInformation =
      "$baseUrl/parent/student-bus-information";
  static const String busRecentTrips =
      "$baseUrl/parent/student-bus-recent-trips";
  static const String busNotifications =
      "$baseUrl/parent/student-bus-notifications";

  // Events Endpoints
  static const String eventsList = "$baseUrl/parent/events-list";
  static const String eventsImagesList = "$baseUrl/parent/events-images-list";
  static const String upcomingEventsList =
      "$baseUrl/parent/upcoming-events-list";

  // Anecdotal Records Endpoints
  static const String anecdotalCategories =
      "$baseUrl/parent/anecdotal-categories-list";
  static const String studentAnecdotalRecords =
      "$baseUrl/parent/student-anecdotal-records";

  // Student Achievement Endpoints
  static const String studentAchievements =
      "$baseUrl/parent/student-achievements-list";

  // Timetable Endpoints
  static const String daysList = "$baseUrl/parent/days-list";
  static const String gradeDivisionTimetable =
      "$baseUrl/parent/grade-division-timetable";

  // Leave Management Endpoints
  static const String leaveTypes = "$baseUrl/parent/leave-types";
  static const String leaveRequest = "$baseUrl/parent/leave-request";
  static const String leaveRequestHistory =
      "$baseUrl/parent/leave-request-history";

  // Student Certficates Endpoints
  static const String studentCertificatesList =
      "$baseUrl/parent/student-certificates-list";

  // Exam Timetable Endpoints
  static const String examTimetableList = "$baseUrl/parent/exam-timetable-list";

  // Student Exam Result Endpoints
  static const String studentExamResultsList =
      "$baseUrl/parent/student-exam-results";
  static const String studentExamRanksList =
      "$baseUrl/parent/student-exam-ranks";

  // Contact School Endpoints
  static const String schoolContactsList =
      "$baseUrl/parent/school-contacts-list";

  static const String departmentEnquiry = "$baseUrl/parent/department-enquiry";
  static const String schoolDepartmentsList =
      "$baseUrl/parent/school-departments-list";

  static const String syllabusProgress =
      "$baseUrl/parent/syllabus-progress-list";
}
