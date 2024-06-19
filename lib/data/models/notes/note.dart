import 'package:flutter/material.dart';

class NoteModel {
  int? id;
  String fullName;
  String text;
  String date;
  String createDate;
  Color color;
  bool isRemove;

  NoteModel(
      {required this.date,
      required this.color,
      required this.fullName,
      required this.text,
      required this.createDate,
      this.isRemove = false,
      this.id});

  factory NoteModel.fromJson(Map<String, dynamic> json) {
    debugPrint(json[NotesConstanse.color].toString());
    return NoteModel(
      id: json[NotesConstanse.id] as int? ?? 0,
      fullName: json[NotesConstanse.name] as String? ?? "Null",
      text: json[NotesConstanse.description] as String? ?? "Null",
      date: json[NotesConstanse.date] as String? ?? "",
      createDate: json[NotesConstanse.createDate] as String? ?? "",
      color: Color(
          int.parse(json[NotesConstanse.color] as String? ?? "0xFFFFFFFF")),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      NotesConstanse.createDate: createDate,
      NotesConstanse.date: date,
      NotesConstanse.description: text,
      NotesConstanse.name: fullName,
      NotesConstanse.color: color.value.toString(),
    };
  }

  Map<String, dynamic> toJsonForUpdate() {
    return {
      NotesConstanse.id: id,
      NotesConstanse.createDate: createDate,
      NotesConstanse.date: date,
      NotesConstanse.description: text,
      NotesConstanse.name: fullName,
      NotesConstanse.color: color.value.toString(),
    };
  }

  static NoteModel defaultModel() {
    return NoteModel(
      date: "",
      fullName: "",
      text: "",
      createDate: "",
      color: Colors.white10,
    );
  }

  NoteModel copyWith({
    String? date,
    String? fullName,
    int? id,
    String? createDate,
    String? text,
    Color? color,
  }) {
    return NoteModel(
      color: color ?? this.color,
      id: id ?? this.id,
      date: date ?? this.date,
      fullName: fullName ?? this.fullName,
      text: text ?? this.text,
      createDate: createDate ?? this.createDate,
    );
  }
}

class NotesConstanse {
  static const tableName = "note_table";
  static const name = "name";
  static const createDate = "create_date";
  static const description = "description";
  static const date = "date";
  static const id = "id";
  static const color = "color";
}
