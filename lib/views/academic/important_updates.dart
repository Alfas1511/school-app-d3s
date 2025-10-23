import 'package:flutter/material.dart';
import 'package:school_app/resources/app_icons.dart';
import 'package:school_app/resources/app_spacing.dart';
import 'package:school_app/views/academic/widgets/listing_card_component.dart';
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
            AppSpacing.vertical(height: 10),

            SectionTitle(title: "Important Updates"),

            const SizedBox(height: 10),

            ListingCardComponent(
              cardTitle: "",
              icon: AppIcons.pdf,
              title: "Math Exam Tomorrow",
              subtitle: "March 18, 10:00 AM - Don't forget calculator",
              tag: "",
              color: Colors.red[50],
              trailingContent: "",
            ),

            ListingCardComponent(
              cardTitle: "",
              icon: AppIcons.file,
              title: "New Study Material",
              subtitle: "Science Chapter 5 Notes Uploaded",
              tag: "",
              color: Colors.blue[50],
              trailingContent: "",
            ),
          ],
        ),
      ),
    );
  }
}
