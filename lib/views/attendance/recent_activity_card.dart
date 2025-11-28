import 'package:flutter/material.dart';
import 'package:school_app/models/student_attendance_model.dart';
import 'package:school_app/resources/app_colours.dart';
import 'package:school_app/resources/app_icons.dart';

class RecentActivityCard extends StatelessWidget {
  final StudentAttendanceModel? studentResponse;

  const RecentActivityCard({super.key, required this.studentResponse});

  @override
  Widget build(BuildContext context) {
    final details = studentResponse?.data?.attendanceDetails ?? [];

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

            details.isEmpty
                ? const Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "No recent activity available",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  )
                : Column(
                    children: details.reversed
                        .map(
                          (detail) => Card(
                            color: AppColours.hexToColor(
                              detail.color,
                            ).withOpacity(0.5),
                            child: ListTile(
                              leading: Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: Icon(
                                  AppIcons.attendanceIcons(
                                    detail.attendanceStatus,
                                  ),
                                  color: AppColours.hexToColor(detail.color),
                                ),
                              ),
                              title: Text(
                                detail.attendanceStatus,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(detail.attendanceDate),
                            ),
                          ),
                        )
                        .toList(),
                  ),
          ],
        ),
      ),
    );
  }
}
