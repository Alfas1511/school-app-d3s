import 'package:flutter/material.dart';
import 'package:school_app/components/update_card.dart';
import 'package:school_app/models/important_updates_model.dart';
import 'package:school_app/resources/app_colours.dart';

class NotificationsExpandedPage extends StatelessWidget {
  final List<ImportantUpdatesData> updates;

  const NotificationsExpandedPage({super.key, required this.updates});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("All Updates")),
      body: updates.isEmpty
          ? Center(
              child: Text(
                "No updates available",
                style: TextStyle(color: Colors.grey),
              ),
            )
          : Container(
              decoration: BoxDecoration(color: Colors.white),
              child: ListView.builder(
                padding: EdgeInsets.all(12),
                itemCount: updates.length,
                itemBuilder: (context, index) {
                  final update = updates[index];

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
                },
              ),
            ),
    );
  }
}
