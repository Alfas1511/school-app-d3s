import 'package:flutter/material.dart';
import 'package:school_app/components/section_title.dart';

class SendMessageFormCard extends StatelessWidget {
  final List<String> departments;
  final String selectedDepartment;
  final Function(String) onDepartmentChanged;

  const SendMessageFormCard({
    super.key,
    required this.departments,
    required this.selectedDepartment,
    required this.onDepartmentChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
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

                      DropdownButton<String>(
                        value: selectedDepartment,
                        isExpanded: true,
                        underline: const SizedBox(),
                        items: departments
                            .map(
                              (child) => DropdownMenuItem(
                                value: child,
                                child: Text(child),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          if (value != null) {
                            onDepartmentChanged(value);
                          }
                        },
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
                      TextField(
                        decoration: InputDecoration(hintText: "Enter subject"),
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

                      const TextField(
                        maxLines: 4,
                        decoration: InputDecoration(
                          hintText: "Type your message here..",
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
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Message Send successfully!"),
                                duration: Duration(seconds: 2),
                                backgroundColor: Colors.green,
                              ),
                            );
                          },
                          child: const Text(
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
