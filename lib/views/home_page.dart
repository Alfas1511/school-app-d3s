// lib/views/home_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_app/resources/app_icons.dart';
import 'package:school_app/views/attendance_page.dart';
import 'package:school_app/views/fee_management_page.dart';
import 'package:school_app/views/more_options_page.dart';
import 'package:school_app/views/profile_management_page.dart';
import 'package:school_app/views/timetable_page.dart';
import '../providers/auth_provider.dart';
import '../views/academics_page.dart';
import '../views/transport_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      _buildHomeContent(),
      const AcademicPage(),
      const AttendancePage(),
      const TransportPage(),
      const MoreOptionsPage(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // ✅ Main Home Content
  Widget _buildHomeContent() {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Section
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF1181CB), Color(0xFF10D6A5)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              padding: const EdgeInsets.only(
                top: 50,
                left: 20,
                right: 20,
                bottom: 30,
              ),
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
                              print("Icon Pressed");
                            },
                            icon: Icon(Icons.wb_sunny),
                          ),
                          IconButton(
                            onPressed: () {
                              print("Icon pressed");
                            },
                            icon: Icon(Icons.notifications),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Text(
                    "Sarah Johnson",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      _buildStudentCard("Emma", "5th Grade - A"),
                      const SizedBox(width: 12),
                      _buildStudentCard("Alex", "3rd Grade - B"),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Important Updates
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Important Updates",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "3 New",
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  _buildUpdateCard(
                    Icons.payment,
                    "Pending Fee Payment",
                    "Quarterly fee: \$850 due by March 15",
                    "Pay Now",
                  ),
                  _buildUpdateCard(
                    Icons.event,
                    "Annual Sports Day",
                    "March 20, 2024 - Registration open",
                    null,
                  ),
                  _buildUpdateCard(
                    Icons.book,
                    "Mid-term Results",
                    "Mathematics test results available",
                    null,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Quick Access
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Text(
                "Quick Access",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                childAspectRatio: 1.2,
                children: [
                  _buildQuickAccess(
                    AppIcons.time,
                    "Attendance",
                    Colors.blue,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AttendancePage(),
                        ),
                      );
                    },
                  ),
                  _buildQuickAccess(
                    AppIcons.book,
                    "Homework",
                    Colors.green,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AcademicPage(),
                        ),
                      );
                    },
                  ),
                  _buildQuickAccess(
                    AppIcons.bus,
                    "Transport",
                    Colors.orange,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TransportPage(),
                        ),
                      );
                    },
                  ),
                  _buildQuickAccess(
                    AppIcons.payment,
                    "Fees",
                    Colors.purple,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FeeManagementPage(),
                        ),
                      );
                    },
                  ),
                  _buildQuickAccess(
                    AppIcons.calendarMonth,
                    "Calendar",
                    Colors.teal,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TimetablePage(),
                        ),
                      );
                    },
                  ),
                  _buildQuickAccess(
                    AppIcons.profile,
                    "Profile",
                    Colors.red,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProfileManagementPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Today's Highlights
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Today's Highlights",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  _buildUpdateCard(
                    Icons.event,
                    "Math Assignment Submitted",
                    "Grade; A+ Great Work",
                    null,
                  ),
                  _buildUpdateCard(
                    Icons.book,
                    "Science Project Winner",
                    "1st Place in School Science Fair",
                    null,
                  ),
                ],
              ),
            ),

            // Recent Achievements
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Recent Achievements",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  _buildUpdateCard(
                    Icons.emoji_events,
                    "Mathematics Excellence Award",
                    "Awarded on March 10, 2024",
                    null,
                  ),
                ],
              ),
            ),

            // Latest Exam Results
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Latest Exam Results",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "View All",
                        style: TextStyle(color: Colors.lightBlue),
                      ),
                    ],
                  ),
                  ListTile(
                    title: Text("Mathematics"),
                    trailing: Text(
                      "95%",
                      style: TextStyle(color: Colors.greenAccent),
                    ),
                  ),
                  ListTile(
                    title: Text("English"),
                    trailing: Text(
                      "88%",
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                  ),
                  ListTile(
                    title: Text("Science"),
                    trailing: Text(
                      "92%",
                      style: TextStyle(color: Colors.redAccent),
                    ),
                  ),
                  // const SizedBox(height: 10),
                  // _buildUpdateCard(Icons.emoji_events, "Mathematics Excellence Award",
                  //     "Awarded on March 10, 2024", null),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ✅ Reusable Widgets
  Widget _buildStudentCard(String name, String grade) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 18,
            backgroundColor: Colors.blue,
            child: Icon(Icons.person, color: Colors.white),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(
                grade,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildUpdateCard(
    IconData icon,
    String title,
    String subtitle,
    String? actionText,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 28, color: Colors.blue),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(subtitle, style: const TextStyle(color: Colors.grey)),
                if (actionText != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Text(
                      actionText,
                      style: const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickAccess(
    IconData icon,
    String label,
    Color color, {
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 28),
          ),
          const SizedBox(height: 6),
          Text(label, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: "Academic",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            label: "Attendance",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_bus),
            label: "Transport",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: "More"),
        ],
      ),
    );
  }
}
