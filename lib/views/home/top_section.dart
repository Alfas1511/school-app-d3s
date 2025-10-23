import 'package:flutter/material.dart';
import 'package:school_app/models/parent_profile_model.dart';
import 'package:school_app/models/students_list_model.dart';
import 'package:school_app/resources/app_spacing.dart';

class TopSection extends StatelessWidget {
  final ParentProfileModel? parentProfile;
  final List<StudentsListModel> students;
  final bool isLoading;
  final StudentsListModel? selectedStudent;
  final Function(StudentsListModel) onStudentSelected;

  const TopSection({
    super.key,
    required this.parentProfile,
    required this.students,
    required this.isLoading,
    required this.selectedStudent,
    required this.onStudentSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF1181CB), Color(0xFF10D6A5)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      padding: const EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Good Morning!",
                style: TextStyle(color: Colors.white70, fontSize: 18),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      //
                    },
                    icon: Icon(Icons.wb_sunny),
                  ),
                  IconButton(
                    onPressed: () {
                      //
                    },
                    icon: Icon(Icons.notifications),
                  ),
                ],
              ),
            ],
          ),
          Text(
            parentProfile?.parentInfo.fatherName.isNotEmpty == true
                ? parentProfile!.parentInfo.fatherName
                : "Parent",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          AppSpacing.vertical(height: 8),
          isLoading
              ? const Center(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: CircularProgressIndicator(color: Colors.white),
                  ),
                )
              : students.isEmpty
              ? const Text(
                  "No students found",
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                )
              : SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: students.map((student) {
                      bool isSelected = selectedStudent?.id == student.id;
                      return GestureDetector(
                        onTap: () => onStudentSelected(student),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: _buildStudentCard(
                            "${student.firstName} ${student.lastName}",
                            "Grade - ${student.grade}${student.division}",
                            isSelected,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
        ],
      ),
    );
  }

  // Child List Widgets
  Widget _buildStudentCard(String name, String grade, bool isSelected) {
    return Container(
      width: 180,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: [
            isSelected
                ? Colors.white.withOpacity(0.4)
                : Colors.white.withOpacity(0.25),
            isSelected
                ? Colors.white.withOpacity(0.2)
                : Colors.white.withOpacity(0.1),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(
          color: isSelected
              ? Colors.yellowAccent
              : Colors.white.withOpacity(0.2),
          width: isSelected ? 2 : 1,
        ),
        boxShadow: [
          if (isSelected)
            BoxShadow(
              color: Colors.yellow.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
        ],
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage('assets/images/student.png'),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  grade,
                  style: const TextStyle(color: Colors.white70, fontSize: 12),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
