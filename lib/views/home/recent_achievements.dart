import 'package:flutter/material.dart';
import 'package:school_app/components/section_title.dart';
import 'package:school_app/models/student_achievements_model.dart';
import 'package:school_app/components/update_card.dart';

class RecentAchievements extends StatelessWidget {
  final StudentAchievementsModel? studentAchievements;
  const RecentAchievements({super.key, this.studentAchievements});

  @override
  Widget build(BuildContext context) {
    final achievements = studentAchievements?.data ?? [];
    if (achievements.isEmpty) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
            SectionTitle(title: "Recent Achievements"),

            const SizedBox(height: 10),

            if (achievements.isEmpty)
              ...achievements.map((achievement) {
                return UpdateCard(
                  icon: Icons.emoji_events,
                  title:
                      "${achievement.competitionItemName} - ${achievement.position}",
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
