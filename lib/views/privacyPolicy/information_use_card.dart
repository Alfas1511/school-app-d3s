import 'package:flutter/material.dart';
import 'package:school_app/components/bullet_item.dart';
import 'package:school_app/components/section_title.dart';

class InformationUseCard extends StatelessWidget {
  const InformationUseCard({super.key});

  final List<String> bulletPoints = const [
    "Provide educational services and communication.",
    "Track student progress and attendance.",
    "Send important notifications and updates.",
    "Improve app functionality and user experience.",
    "Comply with educational regulations and requirements.",
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
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SectionTitle(title: "How We Use Your Information"),

            SizedBox(height: 5),

            ...bulletPoints.map((point) => BulletItem(text: point)),
          ],
        ),
      ),
    );
  }
}
