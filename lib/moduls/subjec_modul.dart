import 'package:default_project/moduls/test.dart';
import 'package:default_project/utils/function.dart';
import 'package:flutter/material.dart';

import 'level_enum.dart';
import 'question_modul.dart';

class SubjectModul {
  final String name;
  final Level level;
  final Color color;
  final List<QuestionModul> questions;

  SubjectModul({
    required this.color,
    required this.level,
    required this.name,
    required this.questions,
  });

  // factory SubjectModul(Map<String, dynamic> json) {
  //   return SubjectModul(
  //     name: json["name"] as String? ?? "",
  //     level: getLevel(json["level"] as String? ?? "easy"),
  //     questions: (json["questions"] ?? []).toList().map(
  //           (e) => QuestionModul.fromJson(e),
  //         ),
  //   );
  // }
  factory SubjectModul.fromJson(Map<String, dynamic> json) {
    return SubjectModul(
      color: (json["color"] as String? ?? "F2954D").toColor(),
      level: getLevel(json["level"] as String? ?? "easy"),
      name: json["subject_name"] as String? ?? "",
      questions: (json["questions"] as List?)
              ?.map((e) => QuestionModul.fromJson(e))
              .toList() ??
          [],
    );
  }
}
