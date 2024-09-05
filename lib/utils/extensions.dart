// expanded extension
import 'package:flutter/material.dart';

extension WidgetExtension on Widget {
  Widget expanded({int flex = 1}) {
    return Expanded(flex: flex, child: this);
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}
