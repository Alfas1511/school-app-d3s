import 'package:flutter/material.dart';
import 'package:school_app/components/section_title.dart';

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

          ListTile(
            leading: Icon(Icons.science, color: Colors.blue),
            title: Text(
              "Science Lab",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text("Experiment on plant growth - bring notebook"),
          ),

          ListTile(
            leading: Icon(Icons.sports_gymnastics, color: Colors.blue),
            title: Text(
              "PE Class",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text("Swimming practice - bring swimmer"),
          ),
        ],
      ),
    );
  }
}
