import 'package:flutter/material.dart';
import 'package:school_app/components/section_title.dart';
import 'package:school_app/components/update_card.dart';
import 'package:school_app/models/todays_highlights_model.dart';

class TodaysHighlights extends StatelessWidget {
  final TodaysHighlightsModel? todaysHighlights;
  const TodaysHighlights({super.key, this.todaysHighlights});

  @override
  Widget build(BuildContext context) {
    final todaysHighlightsData = todaysHighlights?.data ?? [];
    if (todaysHighlightsData.isEmpty) {
      return const SizedBox.shrink();
    }
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

            if (todaysHighlightsData.isNotEmpty)
              ...todaysHighlightsData.map((item) {
                return UpdateCard(
                  icon: Icons.event,
                  title: item.title,
                  subtitle: item.description,
                  color: Colors.lightBlue,
                );
              }).toList(),
          ],
        ),
      ),
    );
  }
}
