import 'package:flutter/material.dart';
import 'package:school_app/components/section_title.dart';
import 'package:school_app/core/constants/api_constants.dart';
import 'package:school_app/core/services/api_service.dart';
import 'package:school_app/models/student_certificates_model.dart';
import 'package:school_app/models/students_list_model.dart';
import 'package:school_app/views/certificates/available_certificates_card.dart';
import 'package:school_app/views/certificates/child_selector_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CertificatesPage extends StatefulWidget {
  const CertificatesPage({super.key});

  @override
  State<CertificatesPage> createState() => _CertificatesPageState();
}

class _CertificatesPageState extends State<CertificatesPage> {
  bool isLoading = true;
  StudentsListModel? fetchedStudents;
  StudentCertificatesModel? studentCertificates;
  List<StudentsListModel> students = [];
  StudentsListModel? selectedStudent;
  List<StudentCertificateData> certificates = [];

  Future<void> _fetchStudentsList() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('auth_token');
      final selectedId = prefs.getInt('selected_student_id');

      final apiService = ApiService();
      final response = await apiService.getRequest(
        ApiConstants.studentList,
        token: token,
      );
      // debugPrint("API RESPONSE ${response}");

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

        setState(() {
          students = fetchedStudents;
          selectedStudent = matchedStudent ?? fetchedStudents.first;
          isLoading = false;
        });

        await prefs.setInt('selected_student_id', selectedStudent!.id);
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

  Future<void> _fetchStudentsCertificates() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('auth_token');
      final selectedId = prefs.getInt('selected_student_id');

      final apiService = ApiService();
      final body = {'student_id': selectedId};

      final response = await apiService.postRequest(
        ApiConstants.studentCertificatesList,
        body,
        token: token,
      );

      if (response['status'] == true) {
        final data = response['data'] as List;

        setState(() {
          certificates = data
              .map((json) => StudentCertificateData.fromJson(json))
              .toList();
          isLoading = false;
        });
      } else {
        setState(() {
          certificates = [];
          isLoading = false;
        });
      }
    } catch (e) {
      debugPrint("Error fetching student certificates: $e");

      setState(() {
        certificates = [];
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchStudentsList();
    _fetchStudentsCertificates();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA),
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 100,
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
              "Certificates",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Text(
              "Download and manage certificates",
              style: TextStyle(color: Colors.white70, fontSize: 18),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Child Dropdown
            ChildSelectorCard(
              students: students,
              selectedStudent: selectedStudent,
              onSelect: (student) async {
                final prefs = await SharedPreferences.getInstance();
                await prefs.setInt('selected_student_id', student.id);

                setState(() {
                  selectedStudent = student;
                  isLoading = true;
                  certificates = [];
                });

                await _fetchStudentsCertificates();
              },
            ),

            const SizedBox(height: 20),

            // Stats Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStatCard("8", "Total\nCertificates", Colors.blue),
                _buildStatCard("6", "Available", Colors.green),
                _buildStatCard("2", "Processing", Colors.orange),
              ],
            ),
            const SizedBox(height: 20),

            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  SectionTitle(title: "Available Certificates"),
                  const SizedBox(height: 10),

                  if (certificates.isEmpty)
                    Center(child: Text("Certificates Unavailable!"))
                  else
                    ...certificates.map((cert) {
                      return AvailableCertificatesCard(
                        title: cert.competitionName,
                        subtitle: cert.competitionItemName,
                        status: cert.status == 1 ? "Available" : "Processing",
                        date: cert.date,
                      );
                    }),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.blue[100],
              ),

              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 12, 12, 20),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Need a new certificate?",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Request additional certificates from the school administration",
                    ),
                    SizedBox(height: 8),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          backgroundColor: Colors.blue,
                        ),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Certificate Request Submitted!"),
                              duration: Duration(seconds: 2),
                              backgroundColor: Colors.green,
                            ),
                          );
                        },
                        child: const Text(
                          "Request Certificate",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String number, String label, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
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
        children: [
          Text(
            number,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 13, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}
