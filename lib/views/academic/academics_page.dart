import 'package:flutter/material.dart';
import 'package:school_app/core/constants/api_constants.dart';
import 'package:school_app/core/services/api_service.dart';
import 'package:school_app/models/important_updates_model.dart';
import 'package:school_app/resources/app_icons.dart';
import 'package:school_app/resources/app_spacing.dart';
import 'package:school_app/views/academic/academic_sections.dart';
import 'package:school_app/views/academic/important_updates.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AcademicPage extends StatefulWidget {
  const AcademicPage({super.key});

  @override
  State<AcademicPage> createState() => _AcademicPageState();
}

class _AcademicPageState extends State<AcademicPage> {
  bool isLoading = true;
  int? studentId;
  String? studentName;
  int? gradeId;
  String? grade;
  int? divisionId;
  String? division;
  ImportantUpdatesModel? importantUpdates;

  @override
  void initState() {
    super.initState();
    _loadStudentName();
    _loadImportantUpdates();
  }

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

  Future<void> _loadImportantUpdates() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('auth_token');
      // final studentId = prefs.getInt('selected_student_id');
      // final gradeId = prefs.getInt('grade_id');
      // final divisionId = prefs.getInt('division_id');

      final apiService = ApiService();
      final response = await apiService.getRequest(
        ApiConstants.academicImportantUpdates,
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
      debugPrint("Error loading academic important updates: $e");
    }
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
              "Academic",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              studentName != null
                  ? "Grade ${grade != null && grade!.isNotEmpty ? "$grade" : ""}${division != null && division!.isNotEmpty ? "$division - " : ""}$studentName"
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImportantUpdates(importantUpdatesData: importantUpdates),
            AppSpacing.vertical(height: 20),
            AcademicSections(),
          ],
        ),
      ),
    );
  }
}
