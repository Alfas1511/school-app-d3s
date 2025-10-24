import 'package:flutter/material.dart';
import 'package:school_app/models/bus_recent_trips_model.dart';

class RecentTripsCard extends StatelessWidget {
  final List<BusRecentTripData>? recentTripsData;

  const RecentTripsCard({super.key, this.recentTripsData});

  @override
  Widget build(BuildContext context) {
    final trips = recentTripsData ?? [];
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
              "Recent Trips",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            if (trips.isEmpty)
              const Center(
                child: Text(
                  "No recent trips available",
                  style: TextStyle(color: Colors.black),
                ),
              )
            else
              Column(
                children: trips.map((trip) {
                  return Card(
                    child: ListTile(
                      leading: Container(
                        padding: const EdgeInsets.all(
                          8,
                        ), // space around the icon
                        decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(
                            0.1,
                          ), // background color
                          shape: BoxShape.circle, // makes it perfectly round
                        ),
                        child: const Icon(
                          Icons.calendar_month,
                          color: Colors.blue, // icon color
                          size: 24,
                        ),
                      ),
                      title: Text(trip.date),
                      subtitle: Text(
                        "${trip.startTime} - ${trip.endTime!.isEmpty ? 'Ongoing' : trip.endTime}",
                      ),
                      trailing: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: trip.status == "Completed"
                              ? Colors.green[100]
                              : Colors.orange[100],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          trip.status,
                          style: TextStyle(
                            color: trip.status == "Completed"
                                ? Colors.green[800]
                                : Colors.orange[800],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
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
