import 'dart:ffi';

import 'package:default_project/data/models/categori/categori_modeul.dart';
import 'package:flutter/material.dart';

import '../../local/local_objescs.dart';
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
  bool isChek;
  bool isDelet;

  TaskModul({
    this.id,
    this.isChek = false,
    this.isDelet = false,
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
      isChek: convetrBool(json[TaskContans.isChek] as String? ?? "false"),
      id: json[TaskContans.id] as int?,
      categoriModul: getCategoriy(json[TaskContans.category] as String? ?? ""),
      day: json[TaskContans.day] as String? ?? "",
      hourMinut: json[TaskContans.hour] as String? ?? "",
      description: json[TaskContans.decreption] as String? ?? "",
      priority: json[TaskContans.priority] as int? ?? 0,
      status: getStatus(json[TaskContans.status] as String? ?? ""),
      title: json[TaskContans.title] as String? ?? "",
    );
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
      TaskContans.title: title,
      TaskContans.isChek: isChek.toString()
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
  static const String isChek = "is_cheek";

}

CategoriModul getCategoriy(String categoriyName) {
  for (CategoriModul categoriModul in categiries) {
    if (categoriModul.title == categoriyName) {
      return categoriModul;
    }
  }
  return CategoriModul(
      color: const Color(0xFF80FFD9), icon: "🌔", title: "Design");
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

bool convetrBool(String bol) {
  if (bol == "true") return true;
  return false;
}
