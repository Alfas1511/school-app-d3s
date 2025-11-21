import 'package:flutter/material.dart';
import 'package:school_app/components/section_title.dart';
import 'package:school_app/core/constants/api_constants.dart';
import 'package:school_app/core/services/api_service.dart';
import 'package:school_app/models/school_departments_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SendMessageFormCard extends StatefulWidget {
  final SchoolDepartmentsModel? schoolDepartments;
  final String? selectedDepartment;
  final Function(String) onDepartmentChanged;

  const SendMessageFormCard({
    super.key,
    required this.schoolDepartments,
    required this.selectedDepartment,
    required this.onDepartmentChanged,
  });

  @override
  State<SendMessageFormCard> createState() => _SendMessageFormCardState();
}

class _SendMessageFormCardState extends State<SendMessageFormCard> {
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController messageController = TextEditingController();
  bool isLoading = false;

  Future<void> sendMessage() async {
    try {
      setState(() => isLoading = true);

      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("auth_token");
      final studentId = prefs.getInt("selected_student_id");

      final apiService = ApiService();

      final body = {
        "student_id": studentId,
        "department_id": widget.selectedDepartment,
        "subject": subjectController.text.trim(),
        "enquiry_message": messageController.text.trim(),
      };

      final response = await apiService.postRequest(
        ApiConstants.departmentEnquiry,
        body,
        token: token,
      );

      if (response["status"] == true) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Message Sent Successfully!"),
            backgroundColor: Colors.green,
          ),
        );

        subjectController.clear();
        messageController.clear();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(response["message"] ?? "Something went wrong"),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        // SnackBar(content: Text("Error: $e"), backgroundColor: Colors.red),
        SnackBar(
          content: Text("Something went wrong"),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final deptList = widget.schoolDepartments?.data ?? [];
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Column(
                    children: [
                      SectionTitle(title: 'Send a Message'),

                      SizedBox(height: 10),

                      Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Department",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: DropdownButton<String>(
                              value: widget.selectedDepartment,
                              isExpanded: true,
                              underline: const SizedBox(),
                              hint: const Text("Select Department"),

                              items: deptList
                                  .map(
                                    (item) => DropdownMenuItem(
                                      value: item.id.toString(),
                                      child: Text(item.departmentName),
                                    ),
                                  )
                                  .toList(),

                              onChanged: (value) {
                                widget.onDepartmentChanged(value!);
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Subject",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 5),
                      TextField(
                        controller: subjectController,
                        decoration: InputDecoration(
                          hintText: "Enter subject",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 10),

                  Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Message",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),

                      SizedBox(height: 5),

                      TextField(
                        controller: messageController,
                        maxLines: 4,
                        decoration: InputDecoration(
                          hintText: "Type your message here..",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Align(
                        alignment: Alignment.centerLeft,
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
                            backgroundColor: const Color(0xFFF0f7b72),
                          ),
                          onPressed: isLoading ? null : sendMessage,
                          child: isLoading
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : Text(
                                  "Send Message",
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
