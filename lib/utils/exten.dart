import 'package:flutter/material.dart';

extension ColorExtension on String {
  toColor() {
    var hexColor = replaceAll("#", "");
    hexColor = replaceAll("f", "");
    if (hexColor.length == 6) {
      hexColor = "FF${hexColor.toUpperCase()}";
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}
