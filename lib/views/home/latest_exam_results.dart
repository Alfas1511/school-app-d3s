import 'package:flutter/material.dart';

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
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Latest Exam Results",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
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
