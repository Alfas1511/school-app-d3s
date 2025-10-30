import 'package:flutter/material.dart';

class AppColours {
  static Color primaryColor1 = const Color(0xFFa083f9);
  static Color primaryColor2 = const Color(0xFF3c82f2);
  static Color primaryGreenishColor = const Color(0xFF20c36f);

  static Color singlePurpleblue = const Color(0xFF483ed6);
  static Color singleDeepblue = const Color(0xFF2057e0);

  static Color singleDeepOrange = const Color(0xFFd94f0d);

  Color hexToColor(String hex) {
    hex = hex.replaceAll('#', '');
    if (hex.length == 6) {
      hex = 'FF$hex'; // add alpha (opacity) if not provided
    }
    return Color(int.parse(hex, radix: 16));
  }
}
