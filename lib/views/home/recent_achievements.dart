import 'package:flutter/material.dart';
import 'package:school_app/models/student_achievements_model.dart';
import 'package:school_app/views/home/widgets/update_card.dart';

class RecentAchievements extends StatelessWidget {
  final StudentAchievementsModel? studentAchievements;
  const RecentAchievements({super.key, this.studentAchievements});

  @override
  Widget build(BuildContext context) {
    final achievements = studentAchievements?.data ?? [];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
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

            if (achievements.isEmpty)
              const Center(
                child: Text(
                  "No Achievements data",
                  style: TextStyle(color: Colors.grey),
                ),
              )
            else
              ...achievements.map((achievement) {
                return UpdateCard(
                  icon: Icons.emoji_events,
                  title: "${achievement.competitionItemName} - ${achievement.position}",
                  subtitle: "Awarded on ${achievement.date}",
                  color: Colors.yellow,
                );
              }),
          ],
        ),
      ),
    );
  }
}
