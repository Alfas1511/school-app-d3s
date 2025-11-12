import 'package:flutter/material.dart';
import 'package:school_app/components/section_title.dart';

class DataRetentionCard extends StatelessWidget {
  const DataRetentionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            SectionTitle(title: "Data Retention"),

            SizedBox(height: 5),

            Text(
              "We retain personal information for as long as necessary  to provide educational services and comply with leagl obligations.",
            ),

            SizedBox(height: 10),

            Column(
              children: [
                Container(
                  decoration: BoxDecoration(color: Colors.grey[100]),
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Student Records"),
                      Text(
                        "7 years from graduation",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),

                Container(
                  decoration: BoxDecoration(color: Colors.grey[100]),
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Communication Logs"),
                      Text(
                        "3 years",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),

                Container(
                  decoration: BoxDecoration(color: Colors.grey[100]),
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("App Usage Data"),
                      Text(
                        "1 year",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
