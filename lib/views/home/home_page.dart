// lib/views/home_page.dart
import 'package:flutter/material.dart';
import 'package:school_app/core/constants/api_constants.dart';
import 'package:school_app/core/services/api_service.dart';
import 'package:school_app/models/parent_profile_model.dart';
import 'package:school_app/models/student_details_model.dart';
import 'package:school_app/models/students_list_model.dart';
import 'package:school_app/views/attendance/attendance_page.dart';
import 'package:school_app/views/home/important_updates.dart';
import 'package:school_app/views/home/latest_exam_results.dart';
import 'package:school_app/views/home/quick_access.dart';
import 'package:school_app/views/home/recent_achievements.dart';
import 'package:school_app/views/home/todays_highlights.dart';
import 'package:school_app/views/home/top_section.dart';
import 'package:school_app/views/more_options_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../academic/academics_page.dart';
import '../transport/transport_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  bool isLoading = true;
  ParentProfileModel? parentProfile;
  StudentsListModel? selectedStudent;

  List<StudentsListModel> students = [];
  List<Widget> get _pages => [
    _buildHomeContent(),
    AcademicPage(),
    const AttendancePage(),
    const TransportPage(),
    const MoreOptionsPage(),
  ];

  @override
  void initState() {
    super.initState();
    _loadSelectedStudent();
    _fetchParentProfile();
    _fetchStudentsList();
  }

  Future<void> _fetchParentProfile() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('auth_token');

      final apiService = ApiService();
      final response = await apiService.getRequest(
        ApiConstants.parentProfile,
        token: token,
      );

      if (response['status'] == true) {
        final data = response['data'];
        setState(() {
          parentProfile = ParentProfileModel.fromJson(data);
          isLoading = false;
        });
      } else {
        throw Exception(response['message']);
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _loadSelectedStudent() async {
    final prefs = await SharedPreferences.getInstance();
    final selectedId = prefs.getInt('selected_student_id');
    if (selectedId != null) {
      // If student list isn’t loaded yet, we’ll assign it once list is fetched
      setState(() {
        selectedStudent = StudentsListModel(
          id: selectedId,
          admissionNo: '',
          firstName: '',
          lastName: '',
          admissionDate: '',
          dob: '',
          gender: '',
        );
      });
    }
  }

  Future<void> _fetchStudentsList() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('auth_token');

      final apiService = ApiService();
      final response = await apiService.getRequest(
        ApiConstants.studentList,
        token: token,
      );

      if (response['status'] == true) {
        final data = response['data'] as List;
        setState(() {
          students = data
              .map((json) => StudentsListModel.fromJson(json))
              .toList();
          if (students.isNotEmpty) {
            selectedStudent = students.first;
          }
          isLoading = false;
        });

        // Save selected student ID
        if (students.isNotEmpty) {
          await prefs.setInt('selected_student_id', students.first.id);
        }
      } else {
        throw Exception(response['message']);
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<StudentData?> _fetchStudentDetails(int studentId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('auth_token');

      final apiService = ApiService();
      final response = await apiService.postRequest(
        ApiConstants.studentDetails,
        {'student_id': studentId},
        token: token,
      );

      // debugPrint("STUDENT DETAILS RESPONSE: $response");

      // Check if API returned a proper JSON with 'status'
      if (response['status'] == true) {
        final studentResponse = StudentDetailsModel.fromJson(response);
        return studentResponse.data;
      } else {
        throw Exception(response['message'] ?? 'Unknown error');
      }
    } catch (e) {
      debugPrint("Error fetching student details: $e");
      return null;
    }
  }

  Future<void> _handleRefresh() async {
    setState(() {
      isLoading = true;
    });

    // Re-fetch data
    await Future.wait([_fetchParentProfile(), _fetchStudentsList()]);

    setState(() {
      isLoading = false;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Main Home Content
  Widget _buildHomeContent() {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA),
      body: RefreshIndicator(
        color: Colors.blue,
        backgroundColor: Colors.white,
        onRefresh: _handleRefresh,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Section
              TopSection(
                parentProfile: parentProfile,
                students: students,
                isLoading: isLoading,
                selectedStudent: selectedStudent,
                onStudentSelected: (student) async {
                  setState(() {
                    selectedStudent = student;
                  });

                  final prefs = await SharedPreferences.getInstance();
                  // Fetch and store basic student info first
                  await prefs.setInt('student_id', student.id);
                  await prefs.setString(
                    'student_name',
                    "${student.firstName} ${student.lastName}",
                  );
                  // Fetch full student details (which includes grade_id and division_id)
                  final studentDetails = await _fetchStudentDetails(student.id);
                  // print(studentDetails);
                  if (studentDetails != null) {
                    // Store complete details in SharedPreferences
                    await prefs.setString(
                      'student_grade',
                      studentDetails.grade,
                    );
                    await prefs.setString(
                      'student_grade_id',
                      studentDetails.gradeId,
                    );
                    await prefs.setString(
                      'student_division',
                      studentDetails.division,
                    );
                    await prefs.setString(
                      'student_division_id',
                      studentDetails.divisionId,
                    );

                    setState(() {
                      selectedStudent = StudentsListModel(
                        id: studentDetails.id,
                        admissionNo: '',
                        firstName: studentDetails.firstName,
                        lastName: studentDetails.lastName,
                        admissionDate: '',
                        dob: studentDetails.dob,
                        gender: '',
                      );
                    });
                  }
                },
              ),

              const SizedBox(height: 20),
              // Important Updates
              ImportantUpdates(),

              const SizedBox(height: 20),
              // Quick Access
              QuickAccess(),

              const SizedBox(height: 20),
              // Today's Highlights
              TodaysHighlights(),

              const SizedBox(height: 20),
              // Recent Achievements
              RecentAchievements(),

              const SizedBox(height: 20),
              // Latest Exam Results
              LatestExamResults(),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: "Academic",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            label: "Attendance",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_bus),
            label: "Transport",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: "More"),
        ],
      ),
    );
  }
}
