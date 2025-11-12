import 'package:flutter/material.dart';
import 'package:school_app/components/section_title.dart';

class IntroductionCard extends StatelessWidget {
  const IntroductionCard({super.key});

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
            SectionTitle(title: "Introduction"),

            SizedBox(height: 5),

            Text(
              "Springfield Elementary School is committed to protecting the privacy and security of personal information. This Privacy Policy explains how we collect, use, and safeguard information when you use our Parent School App.",
            ),
          ],
        ),
      ),
    );
  }
}
