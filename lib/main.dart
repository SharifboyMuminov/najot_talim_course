import 'dart:async';

import 'package:default_project/app/app.dart';
import 'package:default_project/blocs/notes/notes_bloc.dart';
import 'package:default_project/blocs/notes/notes_event.dart';
import 'package:default_project/screens/splesh/splash_screen.dart';
import 'package:default_project/view_models/connect_sql.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const App());
}
