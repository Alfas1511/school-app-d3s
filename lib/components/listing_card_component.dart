import 'package:flutter/material.dart';
import 'package:school_app/resources/app_colours.dart';

class ListingCardComponent extends StatelessWidget {
  final String? cardTitle;
  final IconData icon;
  final String title;
  final String subtitle;
  final String? tag;
  final String color;
  final String? trailingContent;
  const ListingCardComponent({
    super.key,
    this.cardTitle,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.tag,
    required this.color,
    this.trailingContent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColours.hexToColor(color).withOpacity(0.6),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: AppColours.hexToColor(color), size: 22),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),

                Text(
                  subtitle,
                  style: const TextStyle(color: Colors.black, fontSize: 15),
                ),

                tag != null
                    ? Text(tag!, style: const TextStyle(color: Colors.black))
                    : SizedBox.shrink(),
              ],
            ),
          ),

          const SizedBox(width: 12),

          Container(
            padding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              '$trailingContent',
              style: TextStyle(
                color: AppColours.hexToColor(color),
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
