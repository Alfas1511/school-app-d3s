import 'package:flutter/material.dart';
import 'package:school_app/components/bullet_item.dart';
import 'package:school_app/components/section_title.dart';

class InformationSharingCard extends StatelessWidget {
  const InformationSharingCard({super.key});

  final List<String> bulletPoints = const [
    "We do not sell or rent personal infonmation to third parties.",
    "Information may be shared with authorized school personnel.",
    "Legal compliance may require diaclogure to authorities.",
    "Anonymous, aggregated data may be used for research.",
    "Third-party service providers bound by confidentalty agreements.",
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
            SectionTitle(title: "Information Sharing"),

            SizedBox(height: 5),

            ...bulletPoints.map((point) => BulletItem(text: point)),
          ],
        ),
      ),
    );
  }
}
