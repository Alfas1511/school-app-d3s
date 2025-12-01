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

  bool isEditingFather = false;
  bool isEditingMother = false;
  bool isEditingContact = false;

  // Controllers
  final TextEditingController fatherNameController = TextEditingController();
  final TextEditingController fatherPhoneController = TextEditingController();
  final TextEditingController fatherEmailController = TextEditingController();
  final TextEditingController fatherOccupationController =
      TextEditingController();

  final TextEditingController motherNameController = TextEditingController();
  final TextEditingController motherPhoneController = TextEditingController();
  final TextEditingController motherEmailController = TextEditingController();
  final TextEditingController motherOccupationController =
      TextEditingController();

  final TextEditingController addressController = TextEditingController();
  final TextEditingController emergencyContactController =
      TextEditingController();

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

  Future<void> _saveFatherInfo() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('auth_token');
      final studentId = prefs.getInt('selected_student_id');

      debugPrint("Here..!");
      final body = {
        'student_id': studentId,
        'father_name': fatherNameController.text.trim(),
        'father_email': fatherEmailController.text.trim(),
        'father_phone': fatherPhoneController.text.trim(),
        'father_occupation': fatherOccupationController.text.trim(),
      };

      final apiService = ApiService();
      final response = await apiService.postRequest(
        ApiConstants.fatherInformationEdit,
        body,
        token: token,
      );

      if (response['status'] == true) {
        await _loadAllData();
        setState(() => isEditingFather = false);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Father information updated successfully"),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {}
  }

  Future<void> _saveMotherInfo() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('auth_token');
      final studentId = prefs.getInt('selected_student_id');

      final body = {
        'student_id': studentId,
        'mother_name': motherNameController.text.trim(),
        'mother_email': motherEmailController.text.trim(),
        'mother_phone': motherPhoneController.text.trim(),
        'mother_occupation': motherOccupationController.text.trim(),
      };

      final apiService = ApiService();
      final response = await apiService.postRequest(
        ApiConstants.motherInformationEdit,
        body,
        token: token,
      );

      if (response['status'] == true) {
        await _loadAllData();
        setState(() => isEditingMother = false);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Mother information updated successfully"),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {}
  }

  Future<void> _saveContactInfo() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('auth_token');
      final studentId = prefs.getInt('selected_student_id');

      final body = {
        'student_id': studentId,
        'address': addressController.text.trim(),
        'emergency_contact': emergencyContactController.text.trim(),
      };

      final apiService = ApiService();
      final response = await apiService.postRequest(
        ApiConstants.contactInformationEdit,
        body,
        token: token,
      );

      if (response['status'] == true) {
        await _loadAllData();
        setState(() => isEditingContact = false);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Contact information updated successfully"),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {}
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
                                  // onTap: () {
                                  //   setState(() {
                                  //     selectedStudentIndex = index;
                                  //   });
                                  // },
                                  onTap: () async {
                                    setState(() {
                                      selectedStudentIndex = index;
                                    });

                                    final prefs =
                                        await SharedPreferences.getInstance();
                                    await prefs.setInt(
                                      'selected_student_id',
                                      students[index].id,
                                    );
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
              _parentInformation(
                title: "Father Information",
                name: parentProfile!.parentInfo.fatherName,
                phone: parentProfile!.parentPhone,
                email: parentProfile!.parentInfo.fatherEmail,
                occupation: parentProfile!.parentInfo.fatherOccupation,
                isEditing: isEditingFather,
                onEdit: () => setState(() => isEditingFather = true),
                onSave: _saveFatherInfo,
                nameCtrl: fatherNameController,
                phoneCtrl: fatherPhoneController,
                emailCtrl: fatherEmailController,
                occupationCtrl: fatherOccupationController,
              ),

              // // Mother Information
              AppSpacing.vertical(height: 8),

              _parentInformation(
                title: "Mother Information",
                name: parentProfile!.parentInfo.motherName,
                phone: parentProfile!.parentInfo.motherPhone,
                email: parentProfile!.parentInfo.motherEmail,
                occupation: parentProfile!.parentInfo.motherOccupation,
                isEditing: isEditingMother,
                onEdit: () => setState(() => isEditingMother = true),
                onSave: _saveMotherInfo,
                nameCtrl: motherNameController,
                phoneCtrl: motherPhoneController,
                emailCtrl: motherEmailController,
                occupationCtrl: motherOccupationController,
              ),

              // Contact Information
              AppSpacing.vertical(height: 8),

              _contactInformation(
                students[selectedStudentIndex],
                isEditingContact,
                addressController,
                emergencyContactController,
                () => setState(() => isEditingContact = true),
                _saveContactInfo,
              ),

              AppSpacing.vertical(height: 8),
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
  required bool isEditing,
  required VoidCallback onEdit,
  required VoidCallback onSave,
  required TextEditingController nameCtrl,
  required TextEditingController phoneCtrl,
  required TextEditingController emailCtrl,
  required TextEditingController occupationCtrl,
}) {
  if (isEditing && nameCtrl.text.isEmpty) {
    nameCtrl.text = name;
    phoneCtrl.text = phone;
    emailCtrl.text = email;
    occupationCtrl.text = occupation;
  }

  return Container(
    padding: const EdgeInsets.fromLTRB(12, 20, 12, 20),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            isEditing
                ? TextButton(onPressed: onSave, child: const Text("Save"))
                : IconButton(onPressed: onEdit, icon: const Icon(Icons.edit)),
          ],
        ),

        const SizedBox(height: 10),

        isEditing
            ? Column(
                children: [
                  _inputField("Name", nameCtrl),
                  _inputField("Phone", phoneCtrl),
                  _inputField("Email", emailCtrl),
                  _inputField("Occupation", occupationCtrl),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _displayRow("Name", name),
                  _displayRow("Phone", phone),
                  _displayRow("Email", email),
                  _displayRow("Occupation", occupation),
                ],
              ),
      ],
    ),
  );
}

Widget _contactInformation(
  StudentsListModel student,
  bool isEditing,
  TextEditingController addressCtrl,
  TextEditingController emergencyCtrl,
  VoidCallback onEdit,
  VoidCallback onSave,
) {
  if (isEditing) {
    addressCtrl.text = student.address ?? "";
    emergencyCtrl.text = student.emergencyContact ?? "";
  }

  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Contact Information",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            isEditing
                ? TextButton(onPressed: onSave, child: const Text("Save"))
                : IconButton(onPressed: onEdit, icon: const Icon(Icons.edit)),
          ],
        ),

        isEditing
            ? Column(
                children: [
                  _inputField("Home Address", addressCtrl),
                  _inputField("Emergency Contact", emergencyCtrl),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _displayRow("Home Address", student.address ?? "--"),
                  _displayRow(
                    "Emergency Contact",
                    student.emergencyContact ?? "--",
                  ),
                ],
              ),
      ],
    ),
  );
}

Widget _inputField(String label, TextEditingController controller) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label, style: const TextStyle(color: Colors.grey)),
      TextField(controller: controller),
      const SizedBox(height: 10),
    ],
  );
}

Widget _displayRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8),
    child: Row(
      children: [
        Expanded(child: Text(label)),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
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
