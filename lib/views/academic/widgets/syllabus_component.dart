import 'package:flutter/material.dart';
import 'package:school_app/models/syllabus_progress_model.dart';
import 'package:school_app/views/academic/widgets/progress_row_component.dart';
import 'package:school_app/components/section_title.dart';

class SyllabusComponent extends StatelessWidget {
  final SyllabusProgressModel? syllabusProgress;
  const SyllabusComponent({super.key, this.syllabusProgress});

  @override
  Widget build(BuildContext context) {
    final syllabusProgressData = syllabusProgress?.data ?? [];
    return Column(
      children: [
        SectionTitle(title: "Current Syllabus Progress"),

        SizedBox(height: 10),

        if (syllabusProgressData.isEmpty)
          const Center(child: Text('Data Unavailable!'))
        else
          ...syllabusProgressData.map((item) {
            double progress = (item.completionPercentage ?? 0) / 100;
            return ProgressRowComponent(
              subject: item.subjectName ?? "",
              progress: progress,
              displayPercentage: (item.completionPercentage ?? 0).round(),
              color: item.color ?? "",
            );
          }),
      ],
    );
  }
}
