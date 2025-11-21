import "package:flutter/material.dart";
import "package:school_app/components/section_title.dart";
import "package:school_app/core/constants/api_constants.dart";
import "package:school_app/core/services/api_service.dart";
import "package:school_app/models/school_contacts_model.dart";
import "package:school_app/models/department_contacts_model.dart";
import "package:school_app/views/contactSchool/quick_contacts_card.dart";
import "package:school_app/views/contactSchool/send_message_form_card.dart";
import "package:school_app/views/contactSchool/visit_us_card.dart";
import "package:shared_preferences/shared_preferences.dart";
// import "package:school_app/views/contactSchool/send_message_form_card.dart";

class ContactSupportPage extends StatefulWidget {
  const ContactSupportPage({super.key});

  @override
  State<ContactSupportPage> createState() => _ContactSupportPageState();
}

class _ContactSupportPageState extends State<ContactSupportPage> {
  SchoolContactsModel? schoolContacts;
  DepartmentContactsModel? schoolDepartments;
  String? selectedDepartment = null;

  Future<void> _fetchSchoolContacts() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('auth_token');

      final apiService = ApiService();
      final response = await apiService.getRequest(
        ApiConstants.schoolContactsList,
        token: token,
      );

      // debugPrint("SCHOOL CONTACTS RESPONSE: ${response}");

      if (response['status'] == true) {
        setState(() {
          schoolContacts = SchoolContactsModel.fromJson(response);
        });
      } else {
        throw Exception(response['message'] ?? 'Unknown error');
      }
    } catch (e) {
      debugPrint("Error fetching school contacts: $e");
    }
  }

  Future<void> _fetchSchoolDepartmentsList() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('auth_token');

      final apiService = ApiService();
      final response = await apiService.getRequest(
        ApiConstants.schoolDepartmentsList,
        token: token,
      );

      // debugPrint("SCHOOL CONTACTS RESPONSE: ${response}");

      if (response['status'] == true) {
        setState(() {
          schoolDepartments = DepartmentContactsModel.fromJson(response);
        });
      } else {
        throw Exception(response['message'] ?? 'Unknown error');
      }
    } catch (e) {
      debugPrint("Error fetching school departments: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    selectedDepartment = null;
    _fetchSchoolContacts();
    _fetchSchoolDepartmentsList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // backgroundColor: const Color(0xFFF8B2CDF),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFF0f7b72), Color(0xFFF0f7b72)],
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
            Text("Back to More", style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Color(0xFFF0f7b72),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Contact School",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        Text(
                          "Get in touch with School Administration",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
              child: SectionTitle(title: "Quick Contact"),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 5,
              ),
              child: QuickContactsCard(schoolContactsData: schoolContacts),
            ),

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: SendMessageFormCard(
                selectedDepartment: selectedDepartment,
                schoolDepartments: schoolDepartments,
                onDepartmentChanged: (value) {
                  setState(() {
                    selectedDepartment = value;
                  });
                },
              ),
            ),

            Padding(padding: const EdgeInsets.all(12), child: VisitUsCard()),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
