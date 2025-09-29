import 'package:flutter/material.dart';

class AppStyles {
  static TextStyle title({color = Colors.white, double size = 64}) {
    return TextStyle(color: color, fontSize: size, fontWeight: FontWeight.bold);
  }

  static TextStyle description({dynamic color = Colors.white, double size = 64}) {
    return TextStyle(color: color, fontSize: size);
  }
}
