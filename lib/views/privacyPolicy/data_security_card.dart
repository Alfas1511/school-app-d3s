import 'package:flutter/material.dart';
import 'package:school_app/components/bullet_item.dart';
import 'package:school_app/components/section_title.dart';

class DataSecurityCard extends StatelessWidget {
  const DataSecurityCard({super.key});

  final List<String> bulletPoints = const [
    "Industry-standard encryption for data transmission.",
    "Secure servers with regular securtty audits.",
    "Limited access controls for authorized personnel.",
    "Regular backups and disaster recovery procedures.",
    "Incident response plan for security breaches.",
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
            SectionTitle(title: "Data Security"),

            SizedBox(height: 5),

            ...bulletPoints.map((point) => BulletItem(text: point)),
          ],
        ),
      ),
    );
  }
}
