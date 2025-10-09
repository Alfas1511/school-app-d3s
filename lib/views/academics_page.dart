import 'package:flutter/material.dart';
import 'package:school_app/resources/app_icons.dart';
import 'package:school_app/resources/app_spacing.dart';
import 'package:school_app/widgets/academic_sections.dart';

class AcademicPage extends StatefulWidget {
  const AcademicPage({super.key});

  @override
  State<AcademicPage> createState() => _AcademicPageState();
}

class _AcademicPageState extends State<AcademicPage> {
  int selectedSubject = 0; // 0: Mathematics, 1: English, 2: Science
  int selectedTab = 0; // 0: Study Materials, 1: Syllabus

  final List<String> subjects = ["Mathematics", "English", "Science"];
  final List<String> tabs = ["Study Materials", "Syllabus"];

  final List<AcademicSection> sections = [
    AcademicSection("Materials", AppIcons.file),
    AcademicSection("Syllabus", AppIcons.book),
    AcademicSection("Exams", AppIcons.exam), // replace with your icons
    AcademicSection("Results", AppIcons.results),
    AcademicSection("Progress", AppIcons.progress),
    AcademicSection("Records", AppIcons.records),
  ];

  int selectedSectionIndex = 0; // default selected

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA),
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0,
        backgroundColor: const Color(0xFF6A11CB),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back, color: Colors.white),
        //   onPressed: () => Navigator.pop(context),
        // ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Academic",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Text(
              "Emma Johnson - Grade 5A",
              style: TextStyle(color: Colors.white70, fontSize: 15),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(AppIcons.school, color: Colors.white),
            onPressed: () {
              // Handle notifications action
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                    // Study Materials List
                    AppSpacing.vertical(height: 8),

                    _buildSectionTitle("Important Updates"),

                    const SizedBox(height: 10),

                    _buildMaterialCard(
                      "",
                      AppIcons.pdf,
                      "Math Exam Tomorrow",
                      "March 18, 10:00 AM - Don't forget calculator",
                      Colors.red[50],
                    ),
                    _buildMaterialCard(
                      "",
                      AppIcons.file,
                      "New Study Material",
                      "Science Chapter 5 Notes Uploaded",
                      Colors.blue[50],
                    ),
                  ],
                ),
              ),
            ),

            // // Quick Actions Section
            // _buildSectionTitle("Quick Actions"),
            // const SizedBox(height: 10),
            // Row(
            //   children: [
            //     Expanded(
            //       child: Card(
            //         color: Colors.purple[100],
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(12),
            //         ),
            //         child: Padding(
            //           padding: const EdgeInsets.symmetric(vertical: 20),
            //           child: Column(
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             children: [
            //               Icon(
            //                 Icons.book,
            //                 size: 22,
            //                 color: Colors.purple[700],
            //               ), // Leading icon
            //               const SizedBox(height: 8),
            //               Text(
            //                 "Homework",
            //                 style: TextStyle(
            //                   fontWeight: FontWeight.bold,
            //                   color: Colors.purple[900],
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //       ),
            //     ),
            //     Expanded(
            //       child: Card(
            //         color: Colors.red[100],
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(12),
            //         ),
            //         child: Padding(
            //           padding: const EdgeInsets.symmetric(vertical: 20),
            //           child: Column(
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             children: [
            //               Icon(
            //                 Icons.schedule,
            //                 size: 22,
            //                 color: Colors.red[700],
            //               ), // Leading icon
            //               const SizedBox(height: 8),
            //               Text(
            //                 "Timetable",
            //                 style: TextStyle(
            //                   fontWeight: FontWeight.bold,
            //                   color: Colors.red[900],
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
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
                  children: [
                    AppSpacing.vertical(height: 4),
                    _buildSectionTitle("Academic Sections"),

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
                  children: [
                    AppSpacing.vertical(height: 4),
                    _buildContentCard(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildMaterialCard(
    String? cardTitle,
    IconData icon,
    String title,
    String subtitle,
    Color? color,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.red, size: 22),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),

                Text(subtitle, style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
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
        _buildSectionTitle("Grade 5A - Study Materials"),
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
        _buildSectionTitle("Content Area"),
        const SizedBox(height: 10),
        const Text(
          "This area can be used to display detailed content based on the selected academic section. For example, if 'Materials' is selected, you could show a list of downloadable files here.",
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildExamsContent() {
    return Column(
      children: [
        _buildSectionTitle("Content Area"),
        const SizedBox(height: 10),
        const Text(
          "This area can be used to display detailed content based on the selected academic section. For example, if 'Materials' is selected, you could show a list of downloadable files here.",
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildResultsContent() {
    return Column(
      children: [
        _buildSectionTitle("Content Area"),
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
        _buildSectionTitle("Content Area"),
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
        _buildSectionTitle("Content Area"),
        const SizedBox(height: 10),
        const Text(
          "This area can be used to display detailed content based on the selected academic section. For example, if 'Materials' is selected, you could show a list of downloadable files here.",
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}
