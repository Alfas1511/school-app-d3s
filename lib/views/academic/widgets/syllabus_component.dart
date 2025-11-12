import 'package:flutter/material.dart';
import 'package:school_app/views/academic/widgets/progress_row_component.dart';
import 'package:school_app/components/section_title.dart';

class SyllabusComponent extends StatelessWidget {
  const SyllabusComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(title: "Current Syllabus Progress"),
        const SizedBox(height: 20),
        ProgressRowComponent(
          subject: "Mathematics",
          progress: 0.85,
          color: Colors.blue,
        ),
        const SizedBox(height: 12),
        ProgressRowComponent(
          subject: "Science",
          progress: 0.78,
          color: Colors.green,
        ),
        const SizedBox(height: 12),
        ProgressRowComponent(
          subject: "English",
          progress: 0.92,
          color: Colors.purple,
        ),
      ],
    );
  }
}
