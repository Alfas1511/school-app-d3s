import 'package:flutter/material.dart';
import 'package:school_app/core/constants/api_constants.dart';
import 'package:school_app/core/services/api_service.dart';
import 'package:school_app/models/student_attendance_model.dart';
import 'package:school_app/resources/app_icons.dart';
import 'package:school_app/views/attendance/attendance_summary_card.dart';
import 'package:school_app/views/attendance/monthly_view_card.dart';
import 'package:school_app/views/attendance/recent_activity_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({super.key});

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  String? studentName;
  String? grade;
  String? division;

  // Example attendance data
  final Map<DateTime, String> attendanceStatus = {
    DateTime(2024, 3, 1): 'present',
    DateTime(2024, 3, 2): 'absent',
    DateTime(2024, 3, 4): 'present',
    DateTime(2024, 3, 5): 'present',
    DateTime(2024, 3, 10): 'late',
  };

  Future<void> _loadStudentName() async {
    final prefs = await SharedPreferences.getInstance();
    final name = prefs.getString('student_name');
    final gradeValue = prefs.getString('student_grade');
    final divisionValue = prefs.getString('student_division');
    setState(() {
      studentName = name ?? "Student";
      grade = gradeValue ?? "";
      division = divisionValue ?? "";
    });
  }

  Future<StudentAttendanceData?> _fetchStudentAttendance(int studentId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('auth_token');

      final apiService = ApiService();
      final response = await apiService.postRequest(
        ApiConstants.studentAttendance,
        {'student_id': studentId},
        token: token,
      );

      // debugPrint("STUDENT ATTENDANCE RESPONSE: $response");

      // Check if API returned a proper JSON with 'status'
      if (response['status'] == true) {
        final studentResponse = StudentAttendanceModel.fromJson(response);
        return studentResponse.data;
      } else {
        debugPrint("⚠️ No attendance data: ${response['message']}");
        return null;
      }
    } catch (e) {
      debugPrint("Error fetching student attendance details: $e");
      return null;
    }
  }

  Future<StudentAttendanceData?> _getStudentAttendance() async {
    final prefs = await SharedPreferences.getInstance();
    // final studentId = prefs.getInt('student_id');
    final studentId = prefs.getInt('selected_student_id');

    if (studentId == null) {
      debugPrint("⚠️ No student_id found in SharedPreferences");
      return null;
    }

    return await _fetchStudentAttendance(studentId);
  }

  @override
  void initState() {
    super.initState();
    _loadStudentName();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA),
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0,
        backgroundColor: const Color(0xFF6A11CB),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Attendance",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              studentName != null
                  ? "$studentName - Grade ${grade != null && grade!.isNotEmpty ? "$grade" : ""}${division != null && division!.isNotEmpty ? "$division" : ""}"
                  : "Loading...",
              style: const TextStyle(color: Colors.white70, fontSize: 15),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(AppIcons.school, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: FutureBuilder<StudentAttendanceData?>(
        future: _getStudentAttendance(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return const Center(child: Text("No attendance data available"));
          }

          final attendanceData = snapshot.data!;

          final totalDays =
              attendanceData.presentCount +
              attendanceData.absentCount +
              attendanceData.lateCount;

          // ✅ Build map from attendance details
          final Map<DateTime, String> attendanceStatusMap = {
            for (var detail in attendanceData.attendanceDetails)
              DateTime.parse(detail.attendanceDate): detail.attendanceStatus
                  .toLowerCase(),
          };

          return SingleChildScrollView(
            child: Column(
              children: [
                AttendanceSummaryCard(
                  presentCount: attendanceData.presentCount.toString(),
                  absentCount: attendanceData.absentCount.toString(),
                  lateCount: attendanceData.lateCount.toString(),
                  totalDays: totalDays.toString(),
                ),
                MonthlyViewCard(attendanceStatus: attendanceStatusMap),
                RecentActivityCard(
                  attendanceDetails: attendanceData.attendanceDetails,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
