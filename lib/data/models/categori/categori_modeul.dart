import 'package:flutter/material.dart';

class CategoriModul {
  final int? id;
  final String title;
  final String icon;
  final Color color;

  CategoriModul({
    this.id,
    required this.color,
    required this.icon,
    required this.title,
  });

  factory CategoriModul.fromJson(Map<String, dynamic> json) {
    return CategoriModul(
      color: Color(
        int.parse(
          json[CategoryContans.color as String? ?? "0xFF0055A3"],
        ),
      ),
      icon: json[CategoryContans.icon] as String? ?? "😄",
      title: json[CategoryContans.title] as String? ?? "",
      id: json[CategoryContans.id] as int?,
    );
  }

  bool availabel() {
    if (icon.isEmpty) return false;
    if (title.isEmpty) return false;
    return true;
  }

  Map<String, dynamic> toJson() {
    return {
      CategoryContans.color: color.value.toString(),
      CategoryContans.icon: icon.toString(),
      CategoryContans.title: title.toString()
    };
  }

  CategoriModul copyWith({String? icon, String? title, Color? color, int? id}) {
    return CategoriModul(
        id: id,
        color: color ?? this.color,
        icon: icon ?? this.icon,
        title: title ?? this.title);
  }

  static CategoriModul initialValue() {
    return CategoriModul(
        color: const Color(0xFF0055A3), icon: "😄", title: "Hello");
  }
}

class CategoryContans {
  static const String tableNAme = "Categoriy";
  static const String title = "totle";
  static const String icon = "icon";
  static const String color = "color";
  static const String id = "di";
}
