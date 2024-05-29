import 'dart:async';

import 'package:default_project/app/app.dart';
import 'package:default_project/data/local/local_database.dart';
import 'package:default_project/data/local/places_db.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  PlacesDatabase.instance;
  LocalDatabase.databaseInstance;

  runApp( App());
}

