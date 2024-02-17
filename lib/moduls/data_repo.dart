import 'dart:convert';

import 'package:default_project/moduls/burning.dart';
import 'package:flutter/services.dart';

class DataRepository {
  DataRepository._();

  static final DataRepository instanse = DataRepository._();
  factory DataRepository() => instanse;

  List<Burning> allSubject = [];

  Future<void> connectJson() async {
    var data = await rootBundle.loadString("assets/json/data.json");
    var decodeData = await jsonDecode(data);

    allSubject = (decodeData["data"] as List?)
            ?.map((e) => Burning.fromJson(e))
            .toList() ??
        [];
  }
}
