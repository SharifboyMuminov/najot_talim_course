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

  factory TaskModul.fomJson(Map<String, dynamic> json) {
    return TaskModul(
        id: json[TaskContans.id] as int?,
        categoriModul:
            getCategoriy(json[TaskContans.category] as String? ?? ""),
        day: json[TaskContans.day] as String? ?? "",
        hourMinut: json[TaskContans.hour] as String? ?? "",
        description: json[TaskContans.decreption] as String? ?? "",
        priority: json[TaskContans.priority] as int? ?? 0,
        status: getStatus(json[TaskContans.status] as String? ?? ""),
        title: json[TaskContans.title] as String? ?? "");
  }

  Map<String, dynamic> toJson() {
    return {
      TaskContans.id: id,
      TaskContans.category: categoriModul.title,
      TaskContans.decreption: description,
      TaskContans.day: day,
      TaskContans.hour: hourMinut,
      TaskContans.priority: priority,
      TaskContans.status: status.name,
      TaskContans.title: title
    };
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

class TaskContans {
  static const String tableName = "Tasks";
  static const String title = "title";
  static const String id = "id";
  static const String decreption = "descrepstion";
  static const String day = "dedline";
  static const String hour = "hour";
  static const String priority = "priority";
  static const String status = "status";
  static const String category = "category";
}

CategoriModul getCategoriy(String categoriyName) {
  switch (categoriyName) {
    case "Grocery":
      return CategoriModul(
          color: const Color(0xFFCCFF80),
          icon: "assets/icons/gracery.svg",
          title: "Grocery");
    case "Work":
      return CategoriModul(
          color: const Color(0xFFFF9680),
          icon: "assets/icons/work.svg",
          title: "Work");

    case "Sport":
      return CategoriModul(
          color: const Color(0xFF80FFFF),
          icon: "assets/icons/sport.svg",
          title: "Sport");

    case "Design":
      return CategoriModul(
          color: const Color(0xFF80FFD9),
          icon: "assets/icons/design.svg",
          title: "Design");

    case "University":
      return CategoriModul(
          color: const Color(0xFF809CFF),
          icon: "assets/icons/university.svg",
          title: "University");
    case "Social":
      return CategoriModul(
          color: const Color(0xFFFF80EB),
          icon: "assets/icons/social.svg",
          title: "Social");

    case "Music":
      return CategoriModul(
          color: const Color(0xFFFC80FF),
          icon: "assets/icons/music.svg",
          title: "Music");

    case "Health":
      return CategoriModul(
          color: const Color(0xFF80FFA3),
          icon: "assets/icons/health.svg",
          title: "Health");
    case "Movie":
      return CategoriModul(
          color: const Color(0xFF80D1FF),
          icon: "assets/icons/movie.svg",
          title: "Movie");
    default:
      return CategoriModul(
          color: const Color(0xFFFFCC80),
          icon: "assets/icons/categoriy_home.svg",
          title: "Home");
  }
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
