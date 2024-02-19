import 'dart:convert';
import 'package:flutter/services.dart';
import 'subjec_modul.dart';

class DataRepository {
  DataRepository._();

  static final DataRepository instanse = DataRepository._();
  factory DataRepository() => instanse;

  static List<SubjectModul> allSubject = [];


  Future<void> connetcAllSobject() async {
    var data = await rootBundle.loadString("assets/data/test.json");
    var decodeData = await jsonDecode(data);
    
    allSubject = (decodeData["data"] as List?)
            ?.map((e) => SubjectModul.fromJson(e))
            .toList() ??
        [];

  }
}
