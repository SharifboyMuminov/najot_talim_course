import 'package:default_project/utils/exten.dart';
import 'package:flutter/material.dart';

class GameModul {
  final String displayName;
  final String displayIconSmall;
  final List<String> stringList;
  LinearGradient? linearGradient;

  GameModul({
    required this.displayIconSmall,
    required this.displayName,
    required this.stringList,
    this.linearGradient,
  }) {
    if (stringList.isNotEmpty) {
      List<Color> colorS = [];

      for (String i in stringList) {
        colorS.add(i.toColor());
      }

      linearGradient = LinearGradient(colors: colorS);
    } else {
      linearGradient = const LinearGradient(
        colors: [Colors.red, Colors.blue],
      );
    }
  }

  factory GameModul.fromJson(Map<String, dynamic> json) {
    return GameModul(
      displayIconSmall: json["displayIconSmall"] as String? ?? "",
      displayName: json["displayName"] as String? ?? "",
      stringList: json["backgroundGradientColors"] as List<String>? ?? [],
    );
  }
}
