import "package:flutter/material.dart";
import "package:school_app/components/section_title.dart";
import "package:school_app/core/constants/api_constants.dart";
import "package:school_app/core/services/api_service.dart";
import "package:school_app/models/school_contacts_model.dart";
import "package:school_app/views/contactSchool/quick_contacts_card.dart";
import "package:school_app/views/contactSchool/send_message_form_card.dart";
import "package:shared_preferences/shared_preferences.dart";
// import "package:school_app/views/contactSchool/send_message_form_card.dart";

class ContactSupportPage extends StatefulWidget {
  const ContactSupportPage({super.key});

  @override
  State<ContactSupportPage> createState() => _ContactSupportPageState();
}

class _ContactSupportPageState extends State<ContactSupportPage> {
  SchoolContactsModel? schoolContacts;
  String selectedDepartment = "Education";
  final List<String> departments = [
    "Education",
    "Finance",
    "Transport",
    "Cultural",
    "Health",
  ];

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

  @override
  void initState() {
    super.initState();
    _fetchSchoolContacts();
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
                departments: departments,
                onDepartmentChanged: (value) {
                  setState(() {
                    selectedDepartment = value;
                  });
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                decoration: BoxDecoration(color: Colors.white),
                width: double.infinity,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          SectionTitle(title: "Visit Us"),

                          SizedBox(height: 10),

                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              // color: Colors.blueGrey
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Icon(Icons.location_on_outlined),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("123 Education Street"),
                                      Text("Springfield, ST 12345"),
                                      Text("United States"),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
