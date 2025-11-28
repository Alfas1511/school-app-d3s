// lib/views/home_page.dart
import 'package:flutter/material.dart';
import 'package:school_app/core/constants/api_constants.dart';
import 'package:school_app/core/services/api_service.dart';
import 'package:school_app/models/important_updates_model.dart';
import 'package:school_app/models/parent_profile_model.dart';
import 'package:school_app/models/student_achievements_model.dart';
import 'package:school_app/models/student_details_model.dart';
import 'package:school_app/models/student_exam_results_model.dart';
import 'package:school_app/models/students_list_model.dart';
import 'package:school_app/models/todays_highlights_model.dart';
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
  ImportantUpdatesModel? importantUpdates;
  StudentAchievementsModel? studentAchievements;
  StudentExamResultsModel? examsResults;
  TodaysHighlightsModel? todaysHighlightsModel;

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
    _initializeHome();
  }

  Future<void> _initializeHome() async {
    setState(() {
      isLoading = true;
    });

    await _loadSelectedStudent(); // Load previously selected student
    await _fetchParentProfile(); // Load parent profile
    await _fetchStudentsList(); // Load student list & set selected student

    if (selectedStudent != null) {
      await _loadImportantUpdates(selectedStudent!.id);
      await _loadStudentAchievements(selectedStudent!.id);
      await _fetchStudentExamResults(selectedStudent!.id);
    }

    setState(() {
      isLoading = false;
    });
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
      // final selectedId = prefs.getInt('student_id');
      final selectedId = prefs.getInt('selected_student_id');

      final apiService = ApiService();
      final response = await apiService.getRequest(
        ApiConstants.studentList,
        token: token,
      );

      if (response['status'] == true) {
        final data = response['data'] as List;
        final fetchedStudents = data
            .map((json) => StudentsListModel.fromJson(json))
            .toList();

        StudentsListModel? matchedStudent;
        if (selectedId != null) {
          matchedStudent = fetchedStudents.firstWhere(
            (s) => s.id == selectedId,
            orElse: () => fetchedStudents.first,
          );
        }

        // setState(() {
        //   students = fetchedStudents;
        //   selectedStudent = matchedStudent ?? fetchedStudents.first;
        //   isLoading = false;
        // });

        // // Make sure to store the correct selected ID again
        // await prefs.setInt('selected_student_id', selectedStudent!.id);

        setState(() {
          students = fetchedStudents;
        });

        selectedStudent = matchedStudent ?? fetchedStudents.first;

        // Save correct ID again
        await prefs.setInt('selected_student_id', selectedStudent!.id);

        // 🔹 Auto-select student and load all related data
        await _selectStudent(selectedStudent!);
      } else {
        throw Exception(response['message']);
      }
    } catch (e) {
      debugPrint("Error fetching student list: $e");
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

  Future<void> _loadImportantUpdates(int studentId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('auth_token');

      final apiService = ApiService();
      final response = await apiService.getRequest(
        ApiConstants.homeImportantUpdates,
        token: token,
      );

      if (response['status'] == true) {
        setState(() {
          importantUpdates = ImportantUpdatesModel.fromJson(response);
          isLoading = false;
        });
      } else {
        throw Exception(response['message']);
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      debugPrint("Error loading important updates: $e");
    }
  }

  Future<void> _loadTodaysHighlights(int studentId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('auth_token');
      final studentId = prefs.getString('selected_student_id');
      final body = {'student_id': studentId};

      final apiService = ApiService();
      final response = await apiService.postRequest(
        ApiConstants.homeTodaysHighlights,
        body,
        token: token,
      );

      if (response['status'] == true) {
        setState(() {
          todaysHighlightsModel = TodaysHighlightsModel.fromJson(response);
          isLoading = false;
        });
      } else {
        throw Exception(response['message']);
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      debugPrint("Error loading important updates: $e");
    }
  }

  Future<void> _loadStudentAchievements(int studentId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('auth_token');

      final apiService = ApiService();
      final response = await apiService.postRequest(
        ApiConstants.studentAchievements,
        {'student_id': studentId},
        token: token,
      );

      if (response['status'] == true) {
        setState(() {
          studentAchievements = StudentAchievementsModel.fromJson(response);
          isLoading = false;
        });
      } else {
        throw Exception(response['message']);
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      debugPrint("Error loading student achievements: $e");
    }
  }

  Future<void> _selectStudent(StudentsListModel student) async {
    setState(() {
      selectedStudent = student;
      importantUpdates = null;
      isLoading = true;
    });

    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('selected_student_id', student.id);
    await prefs.setString(
      'student_name',
      "${student.firstName} ${student.lastName}",
    );

    // Fetch full student details
    final studentDetails = await _fetchStudentDetails(student.id);
    if (studentDetails != null) {
      await prefs.setString('student_grade', studentDetails.grade);
      await prefs.setString('student_grade_id', studentDetails.gradeId);
      await prefs.setString('student_division', studentDetails.division);
      await prefs.setString('student_division_id', studentDetails.divisionId);

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

    // Load related API data
    await _loadImportantUpdates(student.id);
    await _loadStudentAchievements(student.id);
    await _fetchStudentExamResults(student.id);
    await _loadTodaysHighlights(student.id);

    setState(() {
      isLoading = false;
    });
  }

  Future<void> _fetchStudentExamResults(int studentId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('auth_token');

      final apiService = ApiService();
      final body = {'student_id': studentId};

      final response = await apiService.postRequest(
        ApiConstants.studentExamResultsList,
        body,
        token: token,
      );

      if (response['status'] == true) {
        final studentExamResults = StudentExamResultsModel.fromJson(response);
        setState(() {
          examsResults = studentExamResults;
          isLoading = false;
        });
      } else {
        setState(() {
          examsResults = StudentExamResultsModel(data: []);
          isLoading = false;
        });
        throw Exception(response['message'] ?? 'Unknown error');
      }
    } catch (e) {
      debugPrint("Error fetching exam results: $e");

      setState(() {
        examsResults = StudentExamResultsModel(data: []);
        isLoading = false;
      });
    }
  }

  Future<void> _handleRefresh() async {
    setState(() {
      isLoading = true;
    });

    final prefs = await SharedPreferences.getInstance();
    final selectedId = prefs.getInt('selected_student_id');

    await Future.wait([
      _fetchParentProfile(),
      _fetchStudentsList(),
      if (selectedId != null) _loadImportantUpdates(selectedId),
      if (selectedId != null) _loadStudentAchievements(selectedId),
      if (selectedId != null) _fetchStudentExamResults(selectedId),
      if (selectedId != null) _loadTodaysHighlights(selectedId),
    ]);

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

                // onStudentSelected: (student) async {
                //   setState(() {
                //     selectedStudent = student;
                //     importantUpdates = null; // Clear old updates
                //     isLoading = true;
                //   });

                //   final prefs = await SharedPreferences.getInstance();
                //   await prefs.setInt('selected_student_id', student.id);
                //   await prefs.setString(
                //     'student_name',
                //     "${student.firstName} ${student.lastName}",
                //   );

                //   // Fetch full student details
                //   final studentDetails = await _fetchStudentDetails(student.id);
                //   if (studentDetails != null) {
                //     await prefs.setString(
                //       'student_grade',
                //       studentDetails.grade,
                //     );
                //     await prefs.setString(
                //       'student_grade_id',
                //       studentDetails.gradeId,
                //     );
                //     await prefs.setString(
                //       'student_division',
                //       studentDetails.division,
                //     );
                //     await prefs.setString(
                //       'student_division_id',
                //       studentDetails.divisionId,
                //     );

                //     setState(() {
                //       selectedStudent = StudentsListModel(
                //         id: studentDetails.id,
                //         admissionNo: '',
                //         firstName: studentDetails.firstName,
                //         lastName: studentDetails.lastName,
                //         admissionDate: '',
                //         dob: studentDetails.dob,
                //         gender: '',
                //       );
                //     });
                //   }

                //   // 🔹 Fetch important updates for the newly selected student
                //   await _loadImportantUpdates(student.id);
                //   await _loadStudentAchievements(student.id);
                //   await _fetchStudentExamResults(student.id);

                //   setState(() {
                //     isLoading = false;
                //   });
                // },
                onStudentSelected: (student) => _selectStudent(student),
              ),

              const SizedBox(height: 20),
              // Important Updates
              ImportantUpdates(importantUpdatesData: importantUpdates),

              const SizedBox(height: 20),
              // Quick Access
              QuickAccess(),

              const SizedBox(height: 20),
              // Today's Highlights
              TodaysHighlights(todaysHighlights: todaysHighlightsModel),

              const SizedBox(height: 20),
              // Recent Achievements
              RecentAchievements(studentAchievements: studentAchievements),

              const SizedBox(height: 20),
              // Latest Exam Results
              LatestExamResults(examsResultsData: examsResults),

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
