import 'package:flutter/material.dart';
import 'package:school_app/components/bullet_item.dart';
import 'package:school_app/components/section_title.dart';

class InformationCollectCard extends StatelessWidget {
  const InformationCollectCard({super.key});

  final List<String> bulletPoints = const [
    "Student academic records and performance data.",
    "Attendance and behavioral information.",
    "Parent and guardian contact details.",
    "Communication preferences and app usage data.",
    "Device information for app functionality.",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
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
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SectionTitle(title: "Information We Collect"),

            SizedBox(height: 5),

            ...bulletPoints.map((point) => BulletItem(text: point)),
          ],
        ),
      ),
    );
  }
}
