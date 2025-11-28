import 'package:flutter/material.dart';
import 'package:school_app/resources/app_colours.dart';

class ProgressRowComponent extends StatelessWidget {
  final String subject;
  final double progress;
  final int displayPercentage;
  final String color;

  const ProgressRowComponent({
    super.key,
    required this.subject,
    required this.progress,
    required this.displayPercentage,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              subject,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
            Text(
              "$displayPercentage%",
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 8,
            backgroundColor: Colors.grey.shade200,
            valueColor: AlwaysStoppedAnimation<Color>(
              AppColours.hexToColor(color),
            ),
          ),
        ),
      ],
    );
  }
}
