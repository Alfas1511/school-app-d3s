import 'package:flutter/material.dart';
import 'package:school_app/core/constants/api_constants.dart';
import 'package:school_app/core/services/api_service.dart';
import 'package:school_app/models/leave_types_model.dart';
import 'package:school_app/views/leaveManagement/leave_form_card.dart';
import 'package:school_app/views/leaveManagement/leave_guidelines_card.dart';
import 'package:school_app/views/more_options_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LeaveManagementPage extends StatefulWidget {
  const LeaveManagementPage({super.key});

  @override
  State<LeaveManagementPage> createState() => _LeaveManagementState();
}

class _LeaveManagementState extends State<LeaveManagementPage> {
  int leaveSectionType = 0;
  int selectedLeaveType = 0;
  bool isLoading = true;
  int? studentId;
  String? studentName;
  String? gradeId;
  String? gradeName;
  String? divisionId;
  String? divisionName;
  LeaveTypesModel? leaveTypes;

  final List<String> leaveSectionTypes = ["Apply Leave", "Leave History"];

  Future<void> _loadLeaveTypes() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('auth_token');

      final apiService = ApiService();
      final response = await apiService.getRequest(
        ApiConstants.leaveTypes,
        token: token,
      );

      if (response['status'] == true) {
        setState(() {
          leaveTypes = LeaveTypesModel.fromJson(response);
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

  Future<void> _loadStudentName() async {
    final prefs = await SharedPreferences.getInstance();
    final stId = prefs.getInt('selected_student_id');
    final name = prefs.getString('student_name');
    final gdId = prefs.getString('student_grade_id');
    final gradeValue = prefs.getString('student_grade');
    final divId = prefs.getString('student_division_id');
    final divisionValue = prefs.getString('student_division');
    setState(() {
      studentId = stId ?? 0;
      studentName = name ?? "";
      gradeId = gdId ?? "";
      gradeName = gradeValue ?? "";
      divisionId = divId ?? "";
      divisionName = divisionValue ?? "";
    });
  }

  @override
  void initState() {
    super.initState();
    _loadStudentName();
    _loadLeaveTypes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA),
      appBar: AppBar(
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
          onPressed: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const MoreOptionsPage()),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Leave Management",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Text(
              "$studentName - Grade ${gradeName}${divisionName}",
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
          ],
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  // Toggle Apply Leave / Leave History
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(leaveSectionTypes.length, (
                        index,
                      ) {
                        final isSelected = leaveSectionType == index;
                        return Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                leaveSectionType = index;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 16,
                              ),
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? const Color(0xFF6A11CB)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: isSelected
                                      ? const Color(0xFF6A11CB)
                                      : Colors.grey,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  leaveSectionTypes[index],
                                  style: TextStyle(
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.black87,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  const SizedBox(height: 20),

                  LeaveFormCard(
                    leaveTypes:
                        leaveTypes?.data.map((e) => e.leaveType).toList() ?? [],
                  ),

                  const SizedBox(height: 10),

                  LeaveGuidelinesCard(),
                ],
              ),
            ),
    );
  }
}
