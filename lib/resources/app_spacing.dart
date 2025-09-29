import 'package:flutter/widgets.dart';

class AppSpacing {
  static SizedBox vertical({double height = 24}) => SizedBox(height: height);
  static SizedBox horizontal({double width = 24}) => SizedBox(width: width);
  static SizedBox empty() => SizedBox();
}
