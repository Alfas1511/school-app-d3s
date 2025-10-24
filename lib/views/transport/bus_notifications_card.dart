import 'package:flutter/material.dart';
import 'package:school_app/models/bus_notifications_model.dart';
import 'package:school_app/resources/app_icons.dart';

class BusNotificationsCard extends StatelessWidget {
  final List<BusNotificationData>? busNotificationsData;

  const BusNotificationsCard({super.key, this.busNotificationsData});

  @override
  Widget build(BuildContext context) {
    final busNotifications = busNotificationsData ?? [];

    return Padding(
      padding: const EdgeInsets.all(8),
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
              "Notifications",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            if (busNotifications.isEmpty)
              const Center(
                child: Text(
                  "No notifications available",
                  style: TextStyle(color: Colors.black),
                ),
              )
            else
              Column(
                children: busNotifications.map((busNotification) {
                  return Card(
                    color: busNotification.type == "complete"
                        ? Colors.green[50]
                        : Colors.blue[50],
                    child: ListTile(
                      leading: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          busNotification.type == "complete"
                              ? AppIcons.check
                              : AppIcons.notifications,
                          color: busNotification.type == "complete"
                              ? Colors.green
                              : Colors.blue,
                        ),
                      ),
                      title: Text(
                        busNotification.title,
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      subtitle: Text(busNotification.description),
                    ),
                  );
                }).toList(),
              ),
          ],
        ),
      ),
    );
  }
}
