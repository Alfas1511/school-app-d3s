import 'package:flutter/material.dart';
import 'package:school_app/views/home/widgets/update_card.dart';

class RecentAchievements extends StatelessWidget {
  const RecentAchievements({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                  "Recent Achievements",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 10),
            UpdateCard(
              icon: Icons.emoji_events,
              title: "Mathematics Excellence Award",
              subtitle: "Awarded on March 10, 2024",
              color: const Color.fromARGB(255, 249, 248, 203),
            ),
          ],
        ),
      ),
    );
  }
}
