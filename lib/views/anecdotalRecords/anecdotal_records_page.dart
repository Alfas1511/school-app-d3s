import 'package:flutter/material.dart';
import 'package:school_app/core/constants/api_constants.dart';
import 'package:school_app/core/services/api_service.dart';
import 'package:school_app/models/anecdotal_categories_model.dart';
import 'package:school_app/models/anecdotal_records_model.dart';
import 'package:school_app/views/anecdotalRecords/anecdotal_data_card.dart';
import 'package:school_app/views/anecdotalRecords/filter_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AnecdotalRecordsPage extends StatefulWidget {
  const AnecdotalRecordsPage({super.key});

  @override
  State<AnecdotalRecordsPage> createState() => _AnecdotalRecordsPageState();
}

class _AnecdotalRecordsPageState extends State<AnecdotalRecordsPage> {
  String? studentName;
  String? grade;
  String? division;
  bool isLoading = true;
  AnecdotalCategoryModel? anecdotalCategories;
  AnecdotalRecordsModel? anecdotalRecords;

  @override
  void initState() {
    super.initState();
    _loadStudentName();
    _loadAnecdotalCategories();
    _loadAnecdotalRecords(null); // 👈 load all by default
  }

  Future<void> _handleRefresh() async {
    setState(() {
      isLoading = true;
    });

    final prefs = await SharedPreferences.getInstance();
    final selectedId = prefs.getInt('selected_student_id');
    final category = null;

    await Future.wait([
      _loadAnecdotalCategories(),
      _loadAnecdotalRecords(null),
      if (selectedId != null) _loadAnecdotalRecords(category),
    ]);

    setState(() {
      isLoading = false;
    });
  }

  Future<void> _loadAnecdotalCategories() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('auth_token');

      final apiService = ApiService();
      final response = await apiService.getRequest(
        ApiConstants.anecdotalCategories,
        token: token,
      );

      if (response['status'] == true) {
        setState(() {
          anecdotalCategories = AnecdotalCategoryModel.fromJson(response);
          isLoading = false;
        });
      } else {
        throw Exception(response['message']);
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      debugPrint("Error loading Anecdotal Categories: $e");
    }
  }

  Future<void> _loadAnecdotalRecords(String? category) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('auth_token');
      final studentId = prefs.getInt('selected_student_id');

      final apiService = ApiService();
      final response = await apiService.postRequest(
        ApiConstants.studentAnecdotalRecords,
        {'student_id': studentId, 'category': category},
        token: token,
      );
      debugPrint("Anecdotal Records Response: $response");

      if (response['status'] == true) {
        setState(() {
          anecdotalRecords = AnecdotalRecordsModel.fromJson(response);
          isLoading = false;
        });
      } else {
        throw Exception(response['message']);
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      debugPrint("Error loading Anecdotal Records: $e");
    }
  }

  Future<void> _loadStudentName() async {
    final prefs = await SharedPreferences.getInstance();
    final studentName = prefs.getString('student_name');
    final grade = prefs.getString('student_grade');
    final division = prefs.getString('student_division');
    setState(() {
      this.studentName = studentName ?? "N/A";
      this.grade = grade ?? "N/A";
      this.division = division ?? "N/A";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0,
        backgroundColor: const Color(0xFF6A11CB),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFF0f8278), Color(0xFFF0f8278)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Anecdotal Records",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              "${studentName ?? 'N/A'} - Grade ${grade ?? 'N/A'}${division ?? 'N/A'}",
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
          ],
        ),
      ),
      body: RefreshIndicator(
        color: Colors.green,
        backgroundColor: Colors.white,
        onRefresh: _handleRefresh,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : FilterCard(
                        anecdotalCategories: anecdotalCategories,
                        onCategorySelected: (category) {
                          _loadAnecdotalRecords(
                            category,
                          ); // 👈 reload on select
                        },
                      ),
              ),

              AnecdotalDataCard(
                anecdotalRecords: anecdotalRecords,
                studentName: studentName,
                grade: grade,
                division: division,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
