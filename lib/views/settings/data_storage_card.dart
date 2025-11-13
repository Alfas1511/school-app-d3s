import 'package:flutter/material.dart';
import 'package:school_app/components/section_title.dart';

class DataStorageCard extends StatelessWidget {
  const DataStorageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
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
        children: [
          SectionTitle(title: "Data & Storage"),
          SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.download,
                      color: Colors.orange,
                      size: 25,
                    ),
                    title: Text("Download Data"),
                    subtitle: Text("Export your data and records"),
                    trailing: Icon(Icons.arrow_right),
                  ),

                  ListTile(
                    leading: Icon(Icons.delete, color: Colors.red, size: 25),
                    title: Text("Clear Cache"),
                    subtitle: Text("Free up storage space"),
                    trailing: Icon(Icons.arrow_right),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
