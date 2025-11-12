import 'package:flutter/material.dart';
import 'package:school_app/components/section_title.dart';

class AgreementCard extends StatelessWidget {
  const AgreementCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green[50],
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
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListTile(
          leading: Icon(Icons.check_circle_outline, color: Colors.green),
          title: SectionTitle(title: 'Agreement'),
          subtitle: Text(
            "By using the Parent School App, you acknowledge that you have read, understood, and agree to be bound by this  Privacy Policy and Terms of Service. We may update these terms from time to time, and continued use of the app constitutes acceptance of any changes.",
          ),
        ),
      ),
    );
  }
}
