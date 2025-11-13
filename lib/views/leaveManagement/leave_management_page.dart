import 'package:flutter/material.dart';
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
  int? studentId;
  String? studentName;
  String? gradeId;
  String? gradeName;
  String? divisionId;
  String? divisionName;

  final List<String> leaveSectionTypes = ["Apply Leave", "Leave History"];
  final List<String> leaveTypes = [
    "Sick Leave",
    "Personal",
    "Family Function",
    "Emergency",
  ];

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
      body: SingleChildScrollView(
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
                children: List.generate(leaveSectionTypes.length, (index) {
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
                              color: isSelected ? Colors.white : Colors.black87,
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

            // Submit Leave Application Section
            Container(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Submit Leave Application",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15),

                  // Leave Type
                  const Text(
                    "Leave Type",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 10),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 3.5,
                        ),
                    itemCount: leaveTypes.length,
                    itemBuilder: (context, index) {
                      final isSelected = selectedLeaveType == index;
                      return OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: isSelected
                              ? const Color(0xFF6A11CB)
                              : Colors.white,
                          side: BorderSide(
                            color: isSelected
                                ? const Color(0xFF6A11CB)
                                : Colors.grey,
                            width: 1.5,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            selectedLeaveType = index;
                          });
                        },
                        child: Text(
                          leaveTypes[index],
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black87,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),

                  // Start Date & End Date
                  Row(
                    children: const [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Start Date",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 8),
                            TextField(
                              decoration: InputDecoration(
                                hintText: "-/-/-",
                                suffixIcon: Icon(
                                  Icons.calendar_today,
                                  size: 18,
                                ),
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "End Date",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 8),
                            TextField(
                              decoration: InputDecoration(
                                hintText: "-/-/-",
                                suffixIcon: Icon(
                                  Icons.calendar_today,
                                  size: 18,
                                ),
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Reason for Leave
                  const Text(
                    "Reason for Leave",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),
                  const TextField(
                    maxLines: 4,
                    decoration: InputDecoration(
                      hintText:
                          "Please provide details about your leave request...",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "0/500 characters",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Submit Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        backgroundColor: const Color(0xFF6A11CB),
                      ),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Leave submitted successfully!"),
                            duration: Duration(seconds: 2),
                            backgroundColor: Colors.green,
                          ),
                        );
                      },
                      child: const Text(
                        "Submit Leave",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  // After Submit Button inside Column
                ],
              ),
            ),

            const SizedBox(height: 10),

            LeaveGuidelinesCard(),
          ],
        ),
      ),
    );
  }
}
