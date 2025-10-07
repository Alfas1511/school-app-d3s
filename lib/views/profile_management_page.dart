import 'package:flutter/material.dart';
import 'package:school_app/views/more_options_page.dart';

class ProfileManagementPage extends StatefulWidget {
  const ProfileManagementPage({super.key});

  @override
  State<ProfileManagementPage> createState() => _ProfileManagementState();
}

class _ProfileManagementState extends State<ProfileManagementPage> {
  int selectedChildren = 0;
  // int selectedTab = 0;

  final List<String> children = ["Emma", "James"];
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
          onPressed: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const MoreOptionsPage()),
          ),
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Profile",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Text(
              "Family Information",
              style: TextStyle(color: Colors.white70, fontSize: 18),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            // Child Selection Section
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // ✅ left align content
                children: [
                  _buildSectionTitle("Select Child"),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(children.length, (index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedChildren = index;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: selectedChildren == index
                                ? const Color(0xFF6A11CB)
                                : Colors.grey[400],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            children[index],
                            style: TextStyle(
                              color: selectedChildren == index
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            // Child Details Section
            Container(
              padding: const EdgeInsets.fromLTRB(12, 20, 12, 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipOval(
                        child: Image.network(
                          "https://img.freepik.com/free-photo/programming-background-with-person-working-with-codes-computer_23-2150010125.jpg",
                          height: 80,
                          width: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Emma Johnson",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text("Grade 5A", style: TextStyle(fontSize: 15)),
                          Text(
                            "Roll No: 2024-05-05",
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  Table(
                    columnWidths: const {
                      0: FlexColumnWidth(1),
                      1: FlexColumnWidth(1),
                    },
                    children: const [
                      TableRow(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 4),
                            child: Text("Date of Birth"),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 4),
                            child: Text("Blood Group"),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 4),
                            child: Text(
                              "15/08/2014",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 4),
                            child: Text(
                              "O+",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 4),
                            child: Text("Section"),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 4),
                            child: Text("Admission Date"),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 4),
                            child: Text(
                              "A",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 4),
                            child: Text(
                              "1/4/2020",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),
            // Father Information
            Container(
              padding: const EdgeInsets.fromLTRB(12, 20, 12, 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Father Information",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  // ✅ Structured info with Table
                  Table(
                    columnWidths: const {
                      0: FlexColumnWidth(3),
                      1: FlexColumnWidth(2),
                    },
                    children: const [
                      TableRow(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(2, 10, 2, 6),
                            child: Text("Name"),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(2, 10, 2, 6),
                            child: Text(
                              "",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(2, 0, 2, 6),
                            child: Text(
                              "Robert Johnson",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(2, 0, 2, 6),
                            child: Text(
                              "",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(2, 10, 2, 6),
                            child: Text("Phone"),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(2, 10, 2, 6),
                            child: Text("Occupation"),
                          ),
                        ],
                      ),

                      TableRow(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(2, 0, 2, 6),
                            child: Text(
                              "+1 555-0123",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(2, 0, 2, 6),
                            child: Text(
                              "Software Engineer",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),

                      TableRow(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(2, 10, 2, 6),
                            child: Text("Email"),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(2, 10, 2, 6),
                            child: Text(""),
                          ),
                        ],
                      ),

                      TableRow(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(2, 0, 2, 6),
                            child: Text(
                              "robert1.johnson@gmail.com",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(2, 0, 2, 6),
                            child: Text(""),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),
            // Mother Information
            Container(
              padding: const EdgeInsets.fromLTRB(12, 20, 12, 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Mother Information",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  Table(
                    columnWidths: const {
                      0: FlexColumnWidth(3),
                      1: FlexColumnWidth(2),
                    },
                    children: const [
                      TableRow(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(2, 10, 2, 6),
                            child: Text("Name"),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(2, 10, 2, 6),
                            child: Text(
                              "",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(2, 0, 2, 6),
                            child: Text(
                              "Sarah Johnson",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(2, 0, 2, 6),
                            child: Text(
                              "",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(2, 10, 2, 0),
                            child: Text("Phone"),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(2, 10, 2, 0),
                            child: Text("Occupation"),
                          ),
                        ],
                      ),

                      TableRow(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(2, 0, 2, 6),
                            child: Text(
                              "+1 555-0124",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(2, 0, 2, 6),
                            child: Text(
                              "Marketing Manager",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),

                      TableRow(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(2, 10, 2, 6),
                            child: Text("Email"),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(2, 10, 2, 6),
                            child: Text(""),
                          ),
                        ],
                      ),

                      TableRow(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(2, 0, 2, 6),
                            child: Text(
                              "sarah.johnson@gmail.com",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(2, 0, 2, 6),
                            child: Text(""),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),
            // Contact Information
            Container(
              padding: const EdgeInsets.fromLTRB(12, 20, 12, 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Contact Information",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  Table(
                    columnWidths: const {
                      0: FlexColumnWidth(3),
                      1: FlexColumnWidth(1),
                    },
                    children: const [
                      TableRow(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(2, 10, 2, 6),
                            child: Text("Home Address"),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(2, 10, 2, 6),
                            child: Text(
                              "",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(2, 0, 2, 6),
                            child: Text(
                              "123 Oak Street, Downtown, CA 90210",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(2, 0, 2, 6),
                            child: Text(
                              "",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(2, 10, 2, 6),
                            child: Text("Emergency Contact"),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(2, 10, 2, 6),
                            child: Text(""),
                          ),
                        ],
                      ),

                      TableRow(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(2, 0, 2, 6),
                            child: Text(
                              "+1 555-0125",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(2, 0, 2, 6),
                            child: Text(
                              "",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildSectionTitle(String title) {
  return Text(
    title,
    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  );
}
