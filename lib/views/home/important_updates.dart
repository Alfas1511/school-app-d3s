import 'package:flutter/material.dart';
import 'package:school_app/components/section_title.dart';
import 'package:school_app/models/important_updates_model.dart';
import 'package:school_app/resources/app_colours.dart';
import 'package:school_app/components/update_card.dart';

class ImportantUpdates extends StatelessWidget {
  final ImportantUpdatesModel? importantUpdatesData;
  const ImportantUpdates({super.key, this.importantUpdatesData});

  @override
  Widget build(BuildContext context) {
    final updates = importantUpdatesData?.data ?? [];
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SectionTitle(title: "Important Updates"),

                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.red[100],
                      ),
                      child: Text(
                        "${updates.length} New",
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'View All',
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: 10),

            if (updates.isEmpty)
              const Center(
                child: Text(
                  "No updates available",
                  style: TextStyle(color: Colors.grey),
                ),
              )
            else
              ...updates.map((update) {
                // Optional: Map color based on type
                IconData icon;

                switch (update.typeName.toLowerCase()) {
                  case "fees":
                    icon = Icons.payment;
                    break;
                  case "events":
                    icon = Icons.event;
                    break;
                  case "exams":
                    icon = Icons.book;
                    break;
                  case "results":
                    icon = Icons.assessment;
                    break;
                  default:
                    icon = Icons.notifications;
                }

                return UpdateCard(
                  icon: icon,
                  title: update.title,
                  subtitle: update.description,
                  color: AppColours.hexToColor(update.color),
                  actionText: update.links.isNotEmpty ? "View Details" : null,
                );
              }),
          ],
        ),
      ),
    );
  }
}
