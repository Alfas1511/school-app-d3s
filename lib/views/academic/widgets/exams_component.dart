import 'package:flutter/material.dart';
import 'package:school_app/components/section_title.dart';
import 'package:school_app/models/exam_timetable_model.dart';
import 'package:school_app/views/academic/widgets/exam_card_component.dart';
import 'package:school_app/views/academic/widgets/tab_button_component.dart';

class ExamsComponent extends StatefulWidget {
  final bool isLoading;
  final ExamTimeTableModel? examsTimeTable;
  final Function(int)? onTabChanged;

  const ExamsComponent({
    super.key,
    required this.isLoading,
    required this.examsTimeTable,
    this.onTabChanged,
  });

  @override
  State<ExamsComponent> createState() => _ExamsComponentState();
}

class _ExamsComponentState extends State<ExamsComponent> {
  int selectedTab = 0;
  DateTime parseDate(String? dateStr) {
    if (dateStr == null || dateStr.isEmpty) return DateTime(1900);
    return DateTime.parse(dateStr);
  }

  @override
  Widget build(BuildContext context) {
    final allExams = widget.examsTimeTable?.data ?? [];

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
                    isActive: selectedTab == 0,
                    onTap: () {
                      setState(() => selectedTab = 0);
                      widget.onTabChanged?.call(0);
                    },
                  ),
                  TabButtonComponent(
                    title: "Completed Exams",
                    isActive: selectedTab == 1,
                    onTap: () {
                      setState(() => selectedTab = 1);
                      widget.onTabChanged?.call(1);
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            selectedTab == 0
                ? SectionTitle(title: "Upcoming Exams")
                : SectionTitle(title: "Completed Exams"),

            const SizedBox(height: 16),

            if (widget.isLoading)
              const Center(child: CircularProgressIndicator()),

            if (!widget.isLoading && allExams.isEmpty)
              const Center(child: Text("No exams available")),

            if (!widget.isLoading)
              Column(
                children: allExams.map((exam) {
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
