import 'package:flutter/material.dart';
import 'package:school_app/components/section_title.dart';
import 'package:school_app/components/update_card.dart';

class TodaysHighlights extends StatelessWidget {
  const TodaysHighlights({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionTitle(title: "Today's Highlights"),

            const SizedBox(height: 10),

            UpdateCard(
              icon: Icons.event,
              title: "Math Assignment Submitted",
              subtitle: "Grade; A+ Great Work",
              color: Colors.lightBlue,
            ),

            UpdateCard(
              icon: Icons.book,
              title: "Science Project Winner",
              subtitle: "1st Place in School Science Fair",
              color: Colors.lightGreen,
            ),
          ],
        ),
      ),
    );
  }
}
