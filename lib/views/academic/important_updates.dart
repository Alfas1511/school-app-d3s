import 'package:flutter/material.dart';
import 'package:school_app/resources/app_icons.dart';
import 'package:school_app/resources/app_spacing.dart';
import 'package:school_app/views/academic/widgets/section_title.dart';

class ImportantUpdates extends StatelessWidget {
  const ImportantUpdates({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            AppSpacing.vertical(height: 10),

            SectionTitle(title: "Important Updates"),

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
}
