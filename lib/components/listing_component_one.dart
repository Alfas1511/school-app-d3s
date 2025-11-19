import 'package:flutter/material.dart';
import 'package:school_app/resources/app_colours.dart';

class ListingComponentOne extends StatelessWidget {
  final String title;
  final String value;
  final String bgColor;
  final String textColor;

  const ListingComponentOne({
    super.key,
    required this.title,
    required this.value,
    required this.bgColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: AppColours.hexToColor(bgColor).withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 16,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColours.hexToColor(textColor),
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
