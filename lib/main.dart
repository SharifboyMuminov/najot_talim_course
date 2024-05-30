import 'package:default_project/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // final permis = await [
  //   Permission.audio,
  //   Permission.storage,
  // ].request();

  runApp(App());
}
