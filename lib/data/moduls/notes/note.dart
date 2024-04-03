import 'package:default_project/data/local/local_list/local.dart';
import 'package:flutter/material.dart';

class NoteModel {
  int? id;
  String fullname;
  String text;
  String date;
  String createDate;
  Color color;
  bool isRemove;

  NoteModel(
      {required this.date,
      required this.color,
      required this.fullname,
      required this.text,
      required this.createDate,
      this.isRemove = false,
      this.id});

  factory NoteModel.fromJson(Map<String, dynamic> json) {
    myColors.shuffle();
    // debugPrint(json.toString());
    return NoteModel(
      id: json[NotesConstanse.id] as int? ?? 0,
      fullname: json[NotesConstanse.name] as String? ?? "Null",
      text: json[NotesConstanse.descreption] as String? ?? "Null",
      date: json[NotesConstanse.date] as String? ?? "",
      createDate: json[NotesConstanse.creatDate] as String? ?? "",
      color: myColors.first,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      NotesConstanse.creatDate: createDate,
      NotesConstanse.date: date,
      NotesConstanse.descreption: text,
      NotesConstanse.name: fullname,
    };
  }

  Map<String, dynamic> toJsonForUpdate() {
    return {
      NotesConstanse.id: id,
      NotesConstanse.creatDate: createDate,
      NotesConstanse.date: date,
      NotesConstanse.descreption: text,
      NotesConstanse.name: fullname,
    };
  }

  static NoteModel defoultModul() {
    return NoteModel(
      date: "asd",
      fullname: "das",
      text: "asd",
      createDate: "dsd",
      color: Colors.white10,
    );
  }

  NoteModel copyWith({
    String? date,
    String? fullname,
    int? id,
    String? createDate,
    String? text,
    Color? color,
  }) {
    return NoteModel(
      color: color ?? this.color,
      id: id ?? this.id,
      date: date ?? this.date,
      fullname: fullname ?? this.fullname,
      text: text ?? this.text,
      createDate: createDate ?? this.createDate,
    );
  }
}

class NotesConstanse {
  static const tableName = "note_table";
  static const name = "name";
  static const creatDate = "creat_date";
  static const descreption = "descreption";
  static const date = "date";
  static const id = "id";
  static const color = "color";
}
