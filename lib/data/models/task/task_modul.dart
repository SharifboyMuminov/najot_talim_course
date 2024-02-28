import 'package:default_project/data/models/categori/categori_modeul.dart';
import 'package:flutter/material.dart';

import 'task_status.dart';

class TaskModul {
  final int? id;
  final String title;
  final String description;
  final CategoriModul categoriModul;
  final String day;
  final String hourMinut;
  final int priority;
  final TaskStatus status;
  bool isChek = false;
  bool isDelet = false;

  TaskModul({
    this.id,
    required this.categoriModul,
    required this.day,
    required this.hourMinut,
    required this.description,
    required this.priority,
    required this.status,
    required this.title,
  });

  TaskModul copyWith({
    int? id,
    String? title,
    String? description,
    CategoriModul? categoriModul,
    int? priority,
    TaskStatus? status,
    String? hour,
    String? days,
  }) {
    return TaskModul(
      categoriModul: categoriModul ?? this.categoriModul,
      description: description ?? this.description,
      priority: priority ?? this.priority,
      status: status ?? this.status,
      title: title ?? this.title,
      hourMinut: hour ?? this.hourMinut,
      day: days ?? this.day,
    );
  }

  static TaskModul initialValue() {
    return TaskModul(
        categoriModul: CategoriModul(
            color: const Color(0xFFCCFF80),
            icon: "assets/icons/gracery.svg",
            title: "Grocery"),
        day: "",
        hourMinut: "",
        description: "",
        priority: 1,
        id: 0,
        status: TaskStatus.missed,
        title: "");
  }

  bool canAddTaskToDatabase() {
    if (priority == 0) return false;
    if (description.isEmpty) return false;
    if (title.isEmpty) return false;
    if (hourMinut.isEmpty) return false;
    if (day.isEmpty) return false;

    return true;
  }

  TaskStatus getStatus(String statusText) {
    switch (statusText) {
      case "processing":
        {
          return TaskStatus.processing;
        }
      case "done":
        {
          return TaskStatus.done;
        }
      case "canceled":
        {
          return TaskStatus.canceled;
        }
      default:
        {
          return TaskStatus.missed;
        }
    }
  }

  getInfo() {
    return """
$day
$hourMinut
$title
$description
$priority""";
  }
}
