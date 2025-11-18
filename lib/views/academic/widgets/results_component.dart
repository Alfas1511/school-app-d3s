import 'package:flutter/material.dart';
import 'package:school_app/models/student_exam_results_model.dart';
import 'package:school_app/resources/app_icons.dart';
import 'package:school_app/components/listing_card_component.dart';
import 'package:school_app/components/section_title.dart';

class ResultsComponent extends StatelessWidget {
  final bool isLoading;
  final StudentExamResultsModel? examsResults;
  const ResultsComponent({
    super.key,
    required this.isLoading,
    required this.examsResults,
  });

  @override
  Widget build(BuildContext context) {
    final examsResultsList = examsResults?.data ?? [];

    return Column(
      children: [
        SectionTitle(title: "Recent Results"),

        SizedBox(height: 10),

        if (isLoading) const Center(child: CircularProgressIndicator()),

        if (!isLoading && examsResultsList.isEmpty)
          const Center(child: Text("No Results available")),

        if (!isLoading)
          Column(
            children: examsResultsList.map((result) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: ListingCardComponent(
                  cardTitle: "",
                  icon: AppIcons.trophy,
                  title: "${result.subjectName}",
                  subtitle:
                      "${result.obtainedMarks}/${result.maxMarks} - Grade ${result.gradeLetter}",
                  tag: result.examType,
                  color: result.subjectColor ?? "",
                  trailingContent: result.gradeLetter,
                ),
              );
            }).toList(),
          ),
      ],
    );
  }
}
