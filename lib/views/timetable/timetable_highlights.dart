import 'package:flutter/material.dart';
import 'package:school_app/components/section_title.dart';
import 'package:school_app/components/update_card.dart';

class TimetableHighlights extends StatelessWidget {
  const TimetableHighlights({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
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
        children: [
          SectionTitle(title: "Today's Highlights"),

          SizedBox(height: 10),

          UpdateCard(
            icon: Icons.emoji_events,
            title: "Science Lab",
            subtitle: "Experiment on plant growth - bring notebook",
            color: Colors.blue,
          ),

          UpdateCard(
            icon: Icons.emoji_events,
            title: "PE Class",
            subtitle: "Swimming practice - bring swimmer",
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}
