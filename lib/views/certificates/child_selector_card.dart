import 'package:flutter/material.dart';
import 'package:school_app/components/section_title.dart';
import 'package:school_app/models/students_list_model.dart';

class ChildSelectorCard extends StatelessWidget {
  final List<StudentsListModel> students;
  final StudentsListModel? selectedStudent;
  final Function(StudentsListModel) onSelect;

  const ChildSelectorCard({
    super.key,
    required this.students,
    required this.selectedStudent,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(title: "Select Child"),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: DropdownButton<StudentsListModel>(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              value: selectedStudent,
              isExpanded: true,
              underline: const SizedBox(),
              items: students.map((student) {
                return DropdownMenuItem(
                  value: student,
                  child: Text("${student.firstName} ${student.lastName}"),
                );
              }).toList(),
              onChanged: (value) {
                onSelect(value!);
              },
            ),
          ),
        ],
      ),
    );
  }
}
