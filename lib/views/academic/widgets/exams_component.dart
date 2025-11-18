import 'package:flutter/material.dart';
import 'package:school_app/components/section_title.dart';
import 'package:school_app/models/exam_timetable_model.dart';
import 'package:school_app/views/academic/widgets/exam_card_component.dart';
import 'package:school_app/views/academic/widgets/tab_button_component.dart';

class ExamsComponent extends StatelessWidget {
  final bool isLoading;
  final ExamTimeTableModel? examsTimeTable;
  const ExamsComponent({
    super.key,
    required this.isLoading,
    required this.examsTimeTable,
  });

  @override
  Widget build(BuildContext context) {
    final examList = examsTimeTable?.data ?? [];
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

            SectionTitle(title: "Upcoming Exams"),

            const SizedBox(height: 16),

            if (isLoading) const Center(child: CircularProgressIndicator()),

            if (!isLoading && examList.isEmpty)
              const Center(child: Text("No exams available")),

            if (!isLoading)
              Column(
                children: examList.map((exam) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: ExamCardComponent(
                      subject: exam.subject ?? "",
                      date: "${exam.examDate} • ${exam.examTime}",
                      details: "${exam.examType} • Duration:  ${exam.duration}",
                      daysLeft: exam.daysLeft ?? 0,
                      color: exam.subjectColor ?? "",
                    ),
                  );
                }).toList(),
              ),
          ],
        ),
      ],
    );
  }
}
