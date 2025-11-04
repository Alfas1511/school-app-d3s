import 'package:flutter/material.dart';
import 'package:school_app/models/important_updates_model.dart';
import 'package:school_app/resources/app_icons.dart';
import 'package:school_app/resources/app_spacing.dart';
import 'package:school_app/views/academic/widgets/listing_card_component.dart';
import 'package:school_app/views/academic/widgets/section_title.dart';

class ImportantUpdates extends StatelessWidget {
  final ImportantUpdatesModel? importantUpdatesData;
  const ImportantUpdates({super.key, this.importantUpdatesData});

  @override
  Widget build(BuildContext context) {
    final updates = importantUpdatesData?.data ?? [];
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

            if (updates.isEmpty)
              Center(
                child: Text(
                  "No Updates Available",
                  style: TextStyle(color: Colors.grey[600]),
                ),
              )
            else
              // 🔹 Loop through updates
              ...updates.map((update) {
                return ListingCardComponent(
                  cardTitle: "",
                  icon: AppIcons.file, // or choose based on update.type
                  title: update.title,
                  subtitle: update.description,
                  tag: "",
                  color: Colors.blue[50],
                  trailingContent: "",
                );
              }).toList(),
          ],
        ),
      ),
    );
  }
}
