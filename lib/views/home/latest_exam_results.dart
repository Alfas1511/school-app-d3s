import 'package:flutter/material.dart';
import 'package:school_app/components/section_title.dart';

class LatestExamResults extends StatelessWidget {
  const LatestExamResults({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                SectionTitle(title: "Lastest Exam Results"),

                Text(
                  "View Report",
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            ListTile(
              title: Text("Mathematics"),
              tileColor: Colors.green,
              trailing: Text(
                "95%",
                style: TextStyle(color: Colors.greenAccent, fontSize: 15),
              ),
            ),
            ListTile(
              title: Text("English"),
              tileColor: Colors.green,
              trailing: Text(
                "88%",
                style: TextStyle(color: Colors.blueAccent, fontSize: 15),
              ),
            ),
            ListTile(
              title: Text("Science"),
              tileColor: Colors.green,
              trailing: Text(
                "92%",
                style: TextStyle(color: Colors.redAccent, fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
