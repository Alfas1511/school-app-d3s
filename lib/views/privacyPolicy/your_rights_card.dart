import 'package:flutter/material.dart';
import 'package:school_app/components/bullet_item.dart';
import 'package:school_app/components/section_title.dart';

class YourRightsCard extends StatelessWidget {
  const YourRightsCard({super.key});

  final List<String> bulletPoints = const [
    "Access and review your personal information.",
    "Request corrections to inaccurate data.",
    "Opt-out of non-essential communications.",
    "Request data deletion (subject to legal requirements).",
    "File complaints with relevant authorities.",
  ];

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
            SectionTitle(title: "Your Rights"),

            SizedBox(height: 5),

            ...bulletPoints.map((point) => BulletItem(text: point)),
          ],
        ),
      ),
    );
  }
}
