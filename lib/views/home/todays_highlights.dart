import 'package:flutter/material.dart';
import 'package:school_app/views/home/widgets/update_card.dart';

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
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Today's Highlights",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 10),
            UpdateCard(
              icon: Icons.event,
              title: "Math Assignment Submitted",
              subtitle: "Grade; A+ Great Work",
              color: const Color.fromARGB(255, 161, 225, 255),
            ),
            UpdateCard(
              icon: Icons.book,
              title: "Science Project Winner",
              subtitle: "1st Place in School Science Fair",
              color: const Color.fromARGB(255, 187, 239, 179),
            ),
          ],
        ),
      ),
    );
  }
}
