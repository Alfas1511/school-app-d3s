import 'package:flutter/material.dart';
import 'package:school_app/components/listing_component_one.dart';
import 'package:school_app/components/section_title.dart';
import 'package:school_app/models/student_exam_results_model.dart';

class LatestExamResults extends StatelessWidget {
  final StudentExamResultsModel? examsResultsData;
  const LatestExamResults({super.key, this.examsResultsData});

  @override
  Widget build(BuildContext context) {
    final examsResults = examsResultsData?.data ?? [];

    if (examsResults.isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                SectionTitle(title: "Latest Exam Results"),
                Text(
                  "View Report",
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // List of exam results
            Column(
              children: examsResults.map((examsResult) {
                return ListingComponentOne(
                  title: examsResult.subjectName ?? "",
                  value: examsResult.resultPercentage ?? "",
                  bgColor: examsResult.subjectColor ?? "",
                  textColor: examsResult.subjectColor ?? "",
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
