import 'package:flutter/material.dart';
import 'package:school_app/components/section_title.dart';
import 'package:school_app/resources/app_icons.dart';
import 'package:school_app/views/academic/academics_page.dart';
import 'package:school_app/views/attendance/attendance_page.dart';
import 'package:school_app/views/fee_management_page.dart';
import 'package:school_app/views/profile_management_page.dart';
import 'package:school_app/views/timetable/timetable_page.dart';
import 'package:school_app/views/transport/transport_page.dart';

class QuickAccess extends StatelessWidget {
  const QuickAccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),

            SectionTitle(title: "Quick Access"),

            GridView.count(
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
                      MaterialPageRoute(builder: (context) => AcademicPage()),
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
          ],
        ),
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
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            child: Icon(icon, color: Colors.white, size: 28),
          ),
          const SizedBox(height: 6),
          Text(label, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}
