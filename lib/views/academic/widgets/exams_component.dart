import 'package:flutter/material.dart';
import 'package:school_app/views/academic/widgets/exam_card_component.dart';
import 'package:school_app/views/academic/widgets/tab_button_component.dart';

class ExamsComponent extends StatelessWidget {
  const ExamsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  TabButtonComponent(
                    title: "Upcoming Exams",
                    isActive: true,
                    onTap: () {},
                  ),
                  TabButtonComponent(
                    title: "Completed Exams",
                    isActive: false,
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "Upcoming Exams",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ExamCardComponent(
              subject: "Mathematics Mid-term",
              date: "March 18, 2024 • 10:00 AM",
              details: "Chapters 6–8 • Duration 2 hours",
              daysLeft: 3,
              color: Colors.redAccent.shade100,
            ),
            const SizedBox(height: 12),
            ExamCardComponent(
              subject: "Science Practical",
              date: "March 22, 2024 • 2:00 PM",
              details: "Lab experiments • Duration 1.5 hours",
              daysLeft: 7,
              color: Colors.orangeAccent.shade100,
            ),
            const SizedBox(height: 12),
            ExamCardComponent(
              subject: "English Literature",
              date: "March 25, 2024 • 9:00 AM",
              details: "Poetry & Stories • Duration 2.5 hours",
              daysLeft: 10,
              color: Colors.amberAccent.shade100,
            ),
          ],
        ),
      ],
    );
  }
}
