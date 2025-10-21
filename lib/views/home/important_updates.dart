import 'package:flutter/material.dart';
import 'package:school_app/views/home/widgets/update_card.dart';

class ImportantUpdates extends StatelessWidget {
  const ImportantUpdates({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
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
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.red[100],
                      ),
                      child: Text(
                        "3 New",
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
            UpdateCard(
              icon: Icons.payment,
              title: "Pending Fee Payment",
              subtitle: "Quarterly fee: \$850 due by March 15",
              actionText: "Pay Now",
              color: const Color.fromARGB(255, 167, 232, 255),
            ),
            UpdateCard(
              icon: Icons.event,
              title: "Annual Sports Day",
              subtitle: "March 20, 2024 - Registration open",
              color: const Color.fromARGB(255, 193, 248, 183),
            ),
            UpdateCard(
              icon: Icons.book,
              title: "Mid-term Results",
              subtitle: "Mathematics test results available",
              color: const Color.fromARGB(255, 252, 220, 186),
            ),
          ],
        ),
      ),
    );
  }
}
