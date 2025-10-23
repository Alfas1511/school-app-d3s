import 'package:flutter/material.dart';
import 'package:school_app/models/student_attendance_model.dart';

class RecentActivityCard extends StatelessWidget {
  final List<AttendanceDetail> attendanceDetails;

  const RecentActivityCard({super.key, required this.attendanceDetails});

  Color _getCardColor(String status) {
    switch (status.toLowerCase()) {
      case 'present':
        return Colors.green[100]!;
      case 'absent':
        return Colors.red[100]!;
      case 'late':
        return Colors.orange[100]!;
      default:
        return Colors.grey[200]!;
    }
  }

  IconData _getIcon(String status) {
    switch (status.toLowerCase()) {
      case 'present':
        return Icons.check_circle;
      case 'absent':
        return Icons.close;
      case 'late':
        return Icons.schedule;
      default:
        return Icons.help_outline;
    }
  }

  Color _getIconColor(String status) {
    switch (status.toLowerCase()) {
      case 'present':
        return Colors.green;
      case 'absent':
        return Colors.red;
      case 'late':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Recent Activity",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            attendanceDetails.isNotEmpty
                ? Column(
                    children: attendanceDetails.map((detail) {
                      return Card(
                        color: _getCardColor(detail.attendanceStatus),
                        child: ListTile(
                          leading: Icon(
                            _getIcon(detail.attendanceStatus),
                            color: _getIconColor(detail.attendanceStatus),
                          ),
                          title: Text(
                            detail.attendanceStatus,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(detail.attendanceDate),
                        ),
                      );
                    }).toList(),
                  )
                : const Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "No recent activity available",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
