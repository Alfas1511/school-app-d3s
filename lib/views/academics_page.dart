import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA),
      appBar: AppBar(
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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Academic",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Text(
              "Emma Johnson - Grade 5A",
              style: TextStyle(color: Colors.white70, fontSize: 18),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Subjects Section
            _buildSectionTitle("Subjects"),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(subjects.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedSubject = index;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: selectedSubject == index
                            ? const Color(0xFF6A11CB)
                            : Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        subjects[index],
                        style: TextStyle(
                          color: selectedSubject == index
                              ? Colors.white
                              : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(height: 20),

            // Tabs Section (Study Materials / Syllabus)
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: List.generate(tabs.length, (index) {
                  return Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedTab = index;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: selectedTab == index
                              ? const Color(0xFF6A11CB)
                              : Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          tabs[index],
                          style: TextStyle(
                            color: selectedTab == index
                                ? Colors.white
                                : Colors.black87,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(height: 20),

            // Study Materials List
            _buildSectionTitle("Study Materials"),
            const SizedBox(height: 10),
            _buildMaterialCard(
              Icons.picture_as_pdf,
              "Fractions and Decimals",
              "Chapter 7 study material with examples",
              "2.3 MB",
              "2024-03-10",
            ),
            _buildMaterialCard(
              Icons.insert_drive_file,
              "Geometry Basics",
              "Introduction to shapes and angles",
              "45 MB",
              "2024-03-08",
            ),
            _buildMaterialCard(
              Icons.picture_as_pdf,
              "Practice Worksheets",
              "Additional practice problems",
              "1.8 MB",
              "2024-03-05",
            ),

            const SizedBox(height: 20),

            // Recent Activity Section
            _buildSectionTitle("Recent Activity"),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Card(
                    color: Colors.grey[80],
                    child: ListTile(
                      leading: Icon(Icons.upload),
                      title: Text("New Material Uploaded",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                      subtitle: Text("Mathematics: Fractions and Decimals"),
                      iconColor: Colors.green,
                    ),
                  ),
                  Card(
                    color: Colors.grey[80],
                    child: ListTile(
                      leading: Icon(Icons.check),
                      title: Text("Chapter Completed",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text("English: Grammar Fundamentals"),
                      iconColor: Colors.green,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
            // Quick Actions Section
            _buildSectionTitle("Quick Actions"),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Card(
                    color: Colors.purple[100],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.book,
                            size: 22,
                            color: Colors.purple[700],
                          ), // Leading icon
                          const SizedBox(height: 8),
                          Text(
                            "Homework",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.purple[900],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    color: Colors.red[100],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.schedule,
                            size: 22,
                            color: Colors.red[700],
                          ), // Leading icon
                          const SizedBox(height: 8),
                          Text(
                            "Timetable",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red[900],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildMaterialCard(
    IconData icon,
    String title,
    String subtitle,
    String size,
    String date,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.red, size: 30),
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
                const SizedBox(height: 4),
                Text(
                  "$size  •  $date",
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
          Text(
            "Download",
            style: const TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
