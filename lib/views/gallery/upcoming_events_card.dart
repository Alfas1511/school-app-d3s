import 'package:flutter/material.dart';

class UpcomingEventsCard extends StatelessWidget {
  const UpcomingEventsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Upcoming Events",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          ListTile(
            leading: Icon(Icons.science, color: Colors.blue),
            title: Text(
              "Spring Concert",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text("March 25, 2024 - Music performances"),
          ),
          ListTile(
            leading: Icon(Icons.sports_gymnastics, color: Colors.blue),
            title: Text(
              "Nature Walk",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text("March 30, 2024 - Botanical garden event visit"),
          ),
        ],
      ),
    );
  }
}
