import 'package:flutter/material.dart';
import 'package:school_app/core/constants/api_constants.dart';
import 'package:school_app/core/services/api_service.dart';
import 'package:school_app/models/days_list_model.dart';
import 'package:school_app/models/grade_division_timetable_model.dart';
import 'package:school_app/views/timetable/day_selector_card.dart';
import 'package:school_app/views/timetable/timetable_card.dart';
import 'package:school_app/views/timetable/timetable_highlights.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TimetablePage extends StatefulWidget {
  const TimetablePage({super.key});

  @override
  State<TimetablePage> createState() => _TimetablePageState();
}

class _TimetablePageState extends State<TimetablePage> {
  String? studentName;
  String? gradeName;
  String? divisionName;
  bool isLoading = true;
  DaysListModel? daysList;
  GradeDivisionTimetableModel? timetableData;

  String selectedDay = "Monday";

  Future<void> _loadDaysList() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('auth_token');

      final apiService = ApiService();
      final response = await apiService.getRequest(
        ApiConstants.daysList,
        token: token,
      );

      if (response['status'] == true) {
        setState(() {
          daysList = DaysListModel.fromJson(response);
          isLoading = false;
        });
      } else {
        throw Exception(response['message']);
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      debugPrint("Error loading days list: $e");
    }
  }

  Future<void> _loadGradeDivisionTimetable() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('auth_token');
      final gradeId = prefs.getString('student_grade_id');
      final divisionId = prefs.getString('student_division_id');

      final apiService = ApiService();
      final response = await apiService.postRequest(
        ApiConstants.gradeDivisionTimetable,
        {'grade_id': gradeId, 'division_id': divisionId, 'day': selectedDay},
        token: token,
      );

      if (response['status'] == true) {
        setState(() {
          timetableData = GradeDivisionTimetableModel.fromJson(response);
          isLoading = false;
        });
      } else {
        throw Exception(response['message']);
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      debugPrint("Error loading days list: $e");
    }
  }

  Future<void> _loadStudentName() async {
    final prefs = await SharedPreferences.getInstance();
    final name = prefs.getString('student_name');
    final gradeValue = prefs.getString('student_grade');
    final divisionValue = prefs.getString('student_division');
    setState(() {
      studentName = name ?? "Student";
      gradeName = gradeValue ?? "";
      divisionName = divisionValue ?? "";
    });
  }

  @override
  void initState() {
    super.initState();
    _loadDaysList();
    _loadGradeDivisionTimetable();
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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Timetable",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Text(
              "${studentName} - Grade ${gradeName}${divisionName}",
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Day Selector
            DaySelectorCard(
              daysListData: daysList,
              selectedDay: selectedDay,
              onDaySelected: (day) {
                setState(() {
                  selectedDay = day;
                  isLoading = true;
                });
                _loadGradeDivisionTimetable();
              },
            ),

            SizedBox(height: 12),

            TimetableCard(
              selectedDay: selectedDay,
              timetableData: timetableData,
            ),

            SizedBox(height: 12),

            TimetableHighlights(),
          ],
        ),
      ),
    );
  }
}
