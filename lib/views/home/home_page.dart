// lib/views/home_page.dart
import 'package:flutter/material.dart';
import 'package:school_app/core/constants/api_constants.dart';
import 'package:school_app/core/services/api_service.dart';
import 'package:school_app/models/parent_profile_model.dart';
import 'package:school_app/models/student_details.dart';
import 'package:school_app/models/students_list.dart';
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
import '../transport_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  bool isLoading = true;
  ParentProfile? parentProfile;
  Student? selectedStudent;

  List<Student> students = [];
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
    _fetchStudents();
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
          parentProfile = ParentProfile.fromJson(data);
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
        selectedStudent = Student(
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

  Future<void> _fetchStudents() async {
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
          students = data.map((json) => Student.fromJson(json)).toList();
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
        {'student_id': studentId.toString()}, // your API expects this
        token: token,
      );

      if (response['status'] == true) {
        final studentResponse = StudentDetailsResponse.fromJson(response);
        return studentResponse.data;
      } else {
        throw Exception(response['message']);
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
    await Future.wait([_fetchParentProfile(), _fetchStudents()]);

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
                  await prefs.setInt('student_id', student.id);
                  await prefs.setString(
                    'student_name',
                    "${student.firstName} ${student.lastName}",
                  );
                  await prefs.setString(
                    'student_grade',
                    "${student.grade}",
                  );
                  await prefs.setString(
                    'student_division',
                    "${student.division}",
                  );

                  // Fetch and display details
                  final studentDetails = await _fetchStudentDetails(student.id);
                  if (studentDetails != null) {
                    setState(() {
                      // You can store the details to display later
                      selectedStudent = Student(
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
