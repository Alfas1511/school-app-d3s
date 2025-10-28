import 'package:flutter/material.dart';
import 'package:school_app/models/upcoming_events_model.dart';

class UpcomingEventsCard extends StatelessWidget {
  final UpcomingEventsModel? upcomingEvents;

  const UpcomingEventsCard({super.key, this.upcomingEvents});

  @override
  Widget build(BuildContext context) {
    final events = upcomingEvents?.data ?? [];

    if (events.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Upcoming Events",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 10),
            Center(child: Text("No upcoming events available.")),
          ],
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Upcoming Events",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 8),
          ...events.map(
            (event) => ListTile(
              leading: const Icon(Icons.event, color: Colors.blue),
              title: Text(
                event.eventName,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                "${event.eventDate} • ${event.venue.isNotEmpty ? event.venue : 'Venue not specified'}",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
