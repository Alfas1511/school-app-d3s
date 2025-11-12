import 'package:flutter/material.dart';
import 'package:school_app/components/bullet_item.dart';
import 'package:school_app/components/section_title.dart';

class TermsOfSeviceCard extends StatelessWidget {
  const TermsOfSeviceCard({super.key});

  final List<String> acceptablePoints = const [
    "Use the app only for educational purposes.",
    "Maintain confidentiality of login credentials.",
    "Report any unauthorized access immediately.",
    "Respect the privacy of other users.",
    "Comply with all applicable laws and regulations.",
  ];

  final List<String> prohibitedPoints = const [
    "Sharing login credentials with others.",
    "Attempting to access unauthorized information.",
    "Using the app for commercial purposes.",
    "Harassing or threatening other users.",
    "Distributing malicious software or content.",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue[50],
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
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Terms of Service",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),

            SizedBox(height: 10),

            SectionTitle(title: "Acceptable Use"),

            SizedBox(height: 5),

            ...acceptablePoints.map((point) => BulletItem(text: point)),

            SizedBox(height: 10),

            SectionTitle(title: "Prohibited Activities"),

            SizedBox(height: 5),

            ...prohibitedPoints.map((point) => BulletItem(text: point)),
          ],
        ),
      ),
    );
  }
}
