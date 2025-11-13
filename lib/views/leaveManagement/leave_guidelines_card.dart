import 'package:flutter/material.dart';
import 'package:school_app/components/bullet_item.dart';
import 'package:school_app/components/section_title.dart';

class LeaveGuidelinesCard extends StatelessWidget {
  const LeaveGuidelinesCard({super.key});

  final List<String> guidlinesPoints = const [
    "Apply for leaves atleast 1 day in advance for planned absences.",
    "Medical certificate required for sick leaves exceeding 3 days.",
    "Emergency leaves can be applied respectively within 48 hours.",
    "Contact school office for urgent leave requests.",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(title: "Leave Guidlines"),

          const SizedBox(height: 12),

          ...guidlinesPoints.map((point) => BulletItem(text: point)),
        ],
      ),
    );
  }
}
