import 'package:flutter/material.dart';
import 'package:school_app/components/section_title.dart';

class ContactUsCard extends StatelessWidget {
  const ContactUsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            SectionTitle(title: "Contact Us"),

            SizedBox(height: 5),

            Text(
              "If you have questions about this Privacy Policy or Terms of Service, please contact us:",
            ),

            SizedBox(height: 10),

            Row(
              children: [
                Icon(
                  Icons.mail_outline,
                  color: Colors.deepPurple[500],
                  size: 18,
                ),

                SizedBox(width: 10),

                Text(
                  "support@school.com",
                  style: TextStyle(color: Colors.deepPurple[500]),
                ),
              ],
            ),
            SizedBox(height: 10),

            Row(
              children: [
                Icon(
                  Icons.call_outlined,
                  color: Colors.deepPurple[500],
                  size: 18,
                ),

                SizedBox(width: 10),

                Text(
                  "+1 (555) 123-4567",
                  style: TextStyle(color: Colors.deepPurple[500]),
                ),
              ],
            ),
            SizedBox(height: 10),

            Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: Colors.deepPurple[500],
                  size: 18,
                ),

                SizedBox(width: 10),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("SpringField Elementary School"),
                    Text("123 Education Street"),
                    Text("SpringField, ST 12345"),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
