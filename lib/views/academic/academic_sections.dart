import 'package:flutter/material.dart';
import 'package:school_app/resources/app_icons.dart';
import 'package:school_app/resources/app_spacing.dart';
import 'package:school_app/views/academic/widgets/academic_sections_list.dart';
import 'package:school_app/views/academic/widgets/exam_card_component.dart';
import 'package:school_app/views/academic/widgets/section_title.dart';
import 'package:school_app/views/academic/widgets/progress_row_component.dart';
import 'package:school_app/views/academic/widgets/tab_button_component.dart';

class AcademicSections extends StatefulWidget {
  AcademicSections({super.key});

  @override
  State<AcademicSections> createState() => _AcademicSectionsState();
}

class _AcademicSectionsState extends State<AcademicSections> {
  int selectedSubject = 0;

  int selectedTab = 0;

  final List<String> subjects = ["Mathematics", "English", "Science"];

  final List<String> tabs = ["Study Materials", "Syllabus"];

  final List<AcademicSectionsList> sections = [
    AcademicSectionsList("Materials", AppIcons.file),
    AcademicSectionsList("Syllabus", AppIcons.book),
    AcademicSectionsList("Exams", AppIcons.exam), // replace with your icons
    AcademicSectionsList("Results", AppIcons.results),
    AcademicSectionsList("Progress", AppIcons.progress),
    AcademicSectionsList("Records", AppIcons.records),
  ];

  int selectedSectionIndex = 0;
  // default selected
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                AppSpacing.vertical(height: 4),
                SectionTitle(title: "Academic Sections"),

                const SizedBox(height: 4),
                _buildAcademicSections(),
              ],
            ),
          ),
        ),
        AppSpacing.vertical(height: 12),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [AppSpacing.vertical(height: 4), _buildContentCard()],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAcademicSections() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: sections.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1, // square boxes
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemBuilder: (context, index) {
        final section = sections[index];
        final isSelected = selectedSectionIndex == index;

        return GestureDetector(
          onTap: () {
            setState(() {
              selectedSectionIndex = index;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: isSelected ? Colors.blue[100] : Colors.grey[100],
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isSelected ? Colors.blue : Colors.transparent,
                width: 2,
              ),
            ),
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  section.icon,
                  size: 28,
                  color: isSelected ? Colors.blue : Colors.grey[700],
                ),
                const SizedBox(height: 8),
                Text(
                  section.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isSelected ? Colors.blue : Colors.grey[700],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildContentCard() {
    switch (selectedSectionIndex) {
      case 0:
        return _buildMaterialsContent();
      case 1:
        return _buildSyllabusContent();
      case 2:
        return _buildExamsContent();
      case 3:
        return _buildResultsContent();
      case 4:
        return _buildProgressContent();
      case 5:
        return _buildRecordsContent();
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildMaterialsContent() {
    return Column(
      children: [
        SectionTitle(title: "Grade 5A - Study Materials"),
        const SizedBox(height: 10),
        ListTile(
          leading: const Icon(AppIcons.file, color: Colors.red),
          title: const Text("Mathematics"),
          subtitle: const Text("Chapter 8: Fractions"),
          trailing: IconButton(
            icon: const Icon(Icons.download, color: Colors.blue),
            onPressed: () {
              // Handle download action
            },
          ),
        ),
        ListTile(
          leading: const Icon(AppIcons.file, color: Colors.red),
          title: const Text("Science"),
          subtitle: const Text("Unit 4: Plants and Animals"),
          trailing: IconButton(
            icon: const Icon(Icons.download, color: Colors.blue),
            onPressed: () {
              // Handle download action
            },
          ),
        ),
        ListTile(
          leading: const Icon(AppIcons.file, color: Colors.red),
          title: const Text("English"),
          subtitle: const Text("Grammar and Composition"),
          trailing: IconButton(
            icon: const Icon(Icons.download, color: Colors.blue),
            onPressed: () {
              // Handle download action
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSyllabusContent() {
    return Column(
      children: [
        SectionTitle(title: "Current Syllabus Progress"),
        const SizedBox(height: 20),
        // Progress rows
        ProgressRowComponent(
          subject: "Mathematics",
          progress: 0.85,
          color: Colors.blue,
        ),
        SizedBox(height: 12),
        ProgressRowComponent(
          subject: "Science",
          progress: 0.78,
          color: Colors.green,
        ),
        SizedBox(height: 12),
        ProgressRowComponent(
          subject: "English",
          progress: 0.92,
          color: Colors.purple,
        ),
      ],
    );
  }

  Widget _buildExamsContent() {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tabs (Upcoming / Completed)
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
                    onTap: () {
                      // handle tab change
                    },
                  ),
                  TabButtonComponent(
                    title: "Completed Exams",
                    isActive: false,
                    onTap: () {
                      // handle tab change
                    },
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

            // Exam cards
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

  Widget _buildResultsContent() {
    return Column(
      children: [
        SectionTitle(title: "Content Area"),
        const SizedBox(height: 10),
        const Text(
          "This area can be used to display detailed content based on the selected academic section. For example, if 'Materials' is selected, you could show a list of downloadable files here.",
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildProgressContent() {
    return Column(
      children: [
        SectionTitle(title: "Content Area"),
        const SizedBox(height: 10),
        const Text(
          "This area can be used to display detailed content based on the selected academic section. For example, if 'Materials' is selected, you could show a list of downloadable files here.",
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildRecordsContent() {
    return Column(
      children: [
        SectionTitle(title: "Content Area"),
        const SizedBox(height: 10),
        const Text(
          "This area can be used to display detailed content based on the selected academic section. For example, if 'Materials' is selected, you could show a list of downloadable files here.",
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}
