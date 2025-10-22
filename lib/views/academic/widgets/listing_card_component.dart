import 'package:flutter/material.dart';

class ListingCardComponent extends StatelessWidget {
  final String? cardTitle;
  final IconData icon;
  final String title;
  final String subtitle;
  final String? tag;
  final Color? color;
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
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.red, size: 22),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),

                Text(subtitle, style: const TextStyle(color: Colors.grey)),

                Text('$tag', style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ),

          const SizedBox(width: 12),

          Text(
            '$trailingContent',
            style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
