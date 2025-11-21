import 'package:flutter/material.dart';
import 'package:school_app/core/constants/api_constants.dart';
import 'package:school_app/core/services/api_service.dart';
import 'package:school_app/models/parent_profile_model.dart';
import 'package:school_app/models/students_list_model.dart';
import 'package:school_app/resources/app_spacing.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileManagementPage extends StatefulWidget {
  const ProfileManagementPage({super.key});

  @override
  State<ProfileManagementPage> createState() => _ProfileManagementState();
}

class _ProfileManagementState extends State<ProfileManagementPage> {
  int selectedStudentIndex = 0;
  bool isLoading = true;
  ParentProfileModel? parentProfile;
  StudentsListModel? student;

  List<StudentsListModel> students = [];

  @override
  void initState() {
    super.initState();
    _loadAllData();
  }

  Future<void> _loadAllData() async {
    setState(() => isLoading = true);
    try {
      await Future.wait([_fetchParentProfile(), _fetchStudents()]);
    } catch (e) {
      print("Error fetching data: $e");
    } finally {
      setState(() => isLoading = false);
    }
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
          // isLoading = false;
        });
      } else {
        throw Exception(response['message']);
      }
    } catch (e) {
      // setState(() {
      //   // isLoading = false;
      // });
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
          students = data
              .map((json) => StudentsListModel.fromJson(json))
              .toList();
          // isLoading = false;
        });
      } else {
        throw Exception(response['message']);
      }
    } catch (e) {
      // setState(() {
      //   // isLoading = false;
      // });
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

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (parentProfile == null) {
      return const Scaffold(
        body: Center(child: Text("Failed to load profile")),
      );
    }
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
          onPressed: () => Navigator.pop(context),
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Profile",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Text(
              "Family Information",
              style: TextStyle(color: Colors.white70, fontSize: 15),
            ),
          ],
        ),
      ),
      body: RefreshIndicator(
        color: Colors.blue,
        backgroundColor: Colors.white,
        onRefresh: _handleRefresh,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              // Child Selection Section
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSectionTitle("Select Child"),
                    AppSpacing.vertical(height: 8),
                    students.isEmpty
                        ? const Text("No students available")
                        : SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(students.length, (index) {
                                final student = students[index];
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedStudentIndex = index;
                                    });
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 8),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 8,
                                    ),
                                    decoration: BoxDecoration(
                                      color: selectedStudentIndex == index
                                          ? const Color(0xFF6A11CB)
                                          : Colors.grey[400],
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      "${student.firstName} ${student.lastName}",
                                      style: TextStyle(
                                        color: selectedStudentIndex == index
                                            ? Colors.white
                                            : Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ),
                  ],
                ),
              ),

              AppSpacing.vertical(height: 8),

              isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : students.isNotEmpty
                  ? _buildStudentCard(students[selectedStudentIndex])
                  : const Text("No student data available"),

              // Father Information
              AppSpacing.vertical(height: 8),
              _parentInformation(
                title: "Father Information",
                name: parentProfile!.parentInfo.fatherName,
                phone: parentProfile!.parentPhone,
                email: parentProfile!.parentInfo.fatherEmail,
                occupation: parentProfile!.parentInfo.fatherOccupation,
              ),

              // Mother Information
              AppSpacing.vertical(height: 8),
              _parentInformation(
                title: "Mother Information",
                name: parentProfile!.parentInfo.motherName,
                phone: parentProfile!.parentInfo.motherPhone,
                email: parentProfile!.parentInfo.motherEmail,
                occupation: parentProfile!.parentInfo.motherOccupation,
              ),

              // Contact Information
              AppSpacing.vertical(height: 8),
              isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : students.isNotEmpty
                  ? _contactInformation(students[selectedStudentIndex])
                  : const Text("Contact information unavailable"),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildStudentCard(StudentsListModel student) {
  return Container(
    margin: const EdgeInsets.only(bottom: 16),
    padding: const EdgeInsets.fromLTRB(12, 20, 12, 20),
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
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipOval(
              child: Image.network(
                (student.studentImage?.isNotEmpty ?? false)
                    ? student.studentImage!
                    : "invalid-url",
                height: 80,
                width: 80,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    "assets/images/student.png",
                    height: 80,
                    width: 80,
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${student.firstName} ${student.lastName}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Admission No: ${student.admissionNo}",
                  style: const TextStyle(fontSize: 15),
                ),
                Text(
                  "Admission Date: ${student.admissionDate}",
                  style: const TextStyle(fontSize: 15),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 20),
        Table(
          columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(1)},
          children: [
            TableRow(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  child: Text("Date of Birth"),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  child: Text("Blood Group"),
                ),
              ],
            ),
            TableRow(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Text(
                    student.dob,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Text(
                    student.bloodGroup ?? "",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            TableRow(
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  child: Text("Section"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  child: Text("Admission Date"),
                ),
              ],
            ),
            TableRow(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  child: Text(
                    student.division ?? "--",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Text(
                    student.admissionDate,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _parentInformation({
  required String title,
  required String name,
  required String phone,
  required String email,
  required String occupation,
}) {
  return Container(
    padding: const EdgeInsets.fromLTRB(12, 20, 12, 20),
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
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),

        // ✅ Structured info with Table
        Table(
          columnWidths: const {0: FlexColumnWidth(3), 1: FlexColumnWidth(2)},
          children: [
            TableRow(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(2, 10, 2, 6),
                  child: Text("Name"),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(2, 10, 2, 6),
                  child: Text(
                    "",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(2, 0, 2, 6),
                  child: Text(
                    name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(2, 0, 2, 6),
                  child: Text(
                    "",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(2, 10, 2, 6),
                  child: Text("Phone"),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(2, 10, 2, 6),
                  child: Text("Occupation"),
                ),
              ],
            ),

            TableRow(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(2, 0, 2, 6),
                  child: Text(
                    phone,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(2, 0, 2, 6),
                  child: Text(
                    occupation,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),

            TableRow(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(2, 10, 2, 6),
                  child: Text("Email"),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(2, 10, 2, 6),
                  child: Text(""),
                ),
              ],
            ),

            TableRow(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(2, 0, 2, 6),
                  child: Text(
                    email,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(2, 0, 2, 6),
                  child: Text(""),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _contactInformation(StudentsListModel student) {
  return Container(
    padding: const EdgeInsets.fromLTRB(12, 20, 12, 20),
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
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Contact Information",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),

        Table(
          columnWidths: const {0: FlexColumnWidth(3), 1: FlexColumnWidth(1)},
          children: [
            TableRow(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(2, 10, 2, 6),
                  child: Text("Home Address"),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(2, 10, 2, 6),
                  child: Text(
                    "",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(2, 0, 2, 6),
                  child: Text(
                    student.address ?? "--",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(2, 0, 2, 6),
                  child: Text(
                    "",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(2, 10, 2, 6),
                  child: Text("Emergency Contact"),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(2, 10, 2, 6),
                  child: Text(""),
                ),
              ],
            ),

            TableRow(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(2, 0, 2, 6),
                  child: Text(
                    student.emergencyContact ?? "--",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(2, 0, 2, 6),
                  child: Text(
                    "",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _buildSectionTitle(String title) {
  return Text(
    title,
    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  );
}
