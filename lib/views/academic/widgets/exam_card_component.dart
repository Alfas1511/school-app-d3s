import 'package:flutter/material.dart';
import 'package:school_app/resources/app_colours.dart';

class ExamCardComponent extends StatelessWidget {
  final String subject;
  final String date;
  final String details;
  final int daysLeft;
  final String color;

  const ExamCardComponent({
    super.key,
    required this.subject,
    required this.date,
    required this.details,
    required this.daysLeft,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColours.hexToColor(color).withOpacity(0.2),
        borderRadius: BorderRadius.circular(14),
        border: Border(
          left: BorderSide(color: AppColours.hexToColor(color), width: 5),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                subject,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  "$daysLeft days",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: AppColours.hexToColor(color),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 4),

          Text(
            date,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            details,
            style: TextStyle(
              fontSize: 14,
              color: AppColours.hexToColor(color),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
