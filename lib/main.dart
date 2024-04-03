import 'dart:async';

import 'package:default_project/blocs/notes/notes_bloc.dart';
import 'package:default_project/blocs/notes/notes_event.dart';
import 'package:default_project/screens/splesh/splash_screen.dart';
import 'package:default_project/view_models/connect_sql.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => NotesBloc()..add(NotesCallEvent())),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      builder: (context, child) {
        ScreenUtil.init(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(useMaterial3: false),
          home: child,
        );
      },
      child: const SplashCreen(),
    );
  }
}
