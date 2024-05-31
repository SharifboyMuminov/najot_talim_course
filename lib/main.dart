import 'package:default_project/app/app.dart';
import 'package:default_project/data/local/local_database.dart';
import 'package:default_project/service/permission.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  LocalDatabase();
  await MyPermission.getStoragePermission();

  runApp(App());
}
