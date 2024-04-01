import 'dart:convert';

import 'package:flutter/cupertino.dart';

class NoteModel {
  int? id;
  String fullname;
  String text;
  String date;
  String createDate;
  bool isRemove;

  NoteModel(
      {required this.date,
      required this.fullname,
      required this.text,
      required this.createDate,
      this.isRemove = false,
      this.id});

  factory NoteModel.fromJson(Map<String, dynamic> json) {
    // debugPrint(json.toString());
    return NoteModel(
      id: json[PersonContans.id] as int? ?? 0,
      fullname: json[PersonContans.name] as String? ?? "Null",
      text: json[PersonContans.descreption] as String? ?? "Null",
      date: json[PersonContans.date] as String? ?? "",
      createDate: json[PersonContans.creatDate] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      PersonContans.creatDate: createDate,
      PersonContans.date: date,
      PersonContans.descreption: text,
      PersonContans.name: fullname,
    };
  }

  Map<String, dynamic> toJsonForUpdate() {
    return {
      PersonContans.id: id,
      PersonContans.creatDate: createDate,
      PersonContans.date: date,
      PersonContans.descreption: text,
      PersonContans.name: fullname,
    };
  }

  static NoteModel defoultModul() {
    return NoteModel(
        date: "asd", fullname: "das", text: "asd", createDate: "dsd");
  }

  NoteModel copyWith(
      {String? date,
      String? fullname,
      int? id,
      String? createDate,
      String? text}) {
    return NoteModel(
      id: id ?? this.id,
      date: date ?? this.date,
      fullname: fullname ?? this.fullname,
      text: text ?? this.text,
      createDate: createDate ?? this.createDate,
    );
  }
}

class PersonContans {
  static const tableName = "note_table";
  static const name = "name";
  static const creatDate = "creat_date";
  static const descreption = "descreption";
  static const date = "date";
  static const id = "id";
}
