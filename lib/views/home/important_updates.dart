import 'package:flutter/material.dart';
import 'package:school_app/models/important_updates_model.dart';
import 'package:school_app/views/home/widgets/update_card.dart';

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
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Important Updates",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
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
                MaterialColor cardColor;
                IconData icon;

                switch (update.typeName.toLowerCase()) {
                  case "fees":
                    cardColor = Colors.lightBlue;
                    icon = Icons.payment;
                    break;
                  case "events":
                    cardColor = Colors.lightGreen;
                    icon = Icons.event;
                    break;
                  case "exams":
                    cardColor = Colors.orange;
                    icon = Icons.book;
                    break;
                  case "results":
                    cardColor = Colors.purple;
                    icon = Icons.assessment;
                    break;
                  default:
                    cardColor = Colors.grey;
                    icon = Icons.notifications;
                }

                return UpdateCard(
                  icon: icon,
                  title: update.title,
                  subtitle: update.description,
                  color: cardColor,
                  actionText: update.links.isNotEmpty ? "View Details" : null,
                );
              }),
          ],
        ),
      ),
    );
  }
}
