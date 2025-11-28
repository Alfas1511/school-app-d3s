import 'package:flutter/material.dart';

class AttendanceSummaryCard extends StatelessWidget {
  final int presentCount;
  final int absentCount;
  final int lateCount;

  const AttendanceSummaryCard({
    super.key,
    required this.presentCount,
    required this.absentCount,
    required this.lateCount,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildSummaryItem(
              Icons.check,
              presentCount,
              "Present",
              Colors.green,
            ),
            _buildSummaryItem(Icons.close, absentCount, "Absent", Colors.red),
            _buildSummaryItem(Icons.schedule, lateCount, "Late", Colors.orange),
            _buildSummaryItem(
              Icons.calendar_month,
              presentCount + absentCount + lateCount,
              "Total Days",
              Colors.blue,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryItem(
    IconData icon,
    int value,
    String label,
    Color color,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color),
        ),
        const SizedBox(height: 6),
        Text(
          "$value",
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        Text(label, style: const TextStyle(fontSize: 14)),
      ],
    );
  }
}
