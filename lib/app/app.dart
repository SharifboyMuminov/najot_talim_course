import 'package:default_project/bloc/history/history_bloc.dart';
import 'package:default_project/bloc/history/history_event.dart';
import 'package:default_project/bloc/region/region_bloc.dart';
import 'package:default_project/bloc/region/region_event.dart';
import 'package:default_project/data/local/local_database.dart';
import 'package:default_project/data/local/places_db.dart';
import 'package:default_project/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => PlacesDatabase()),
        RepositoryProvider(create: (_) => LocalDatabase()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => RegionBloc(
              context.read<PlacesDatabase>(),
            )..add(RegionCallEvent()),
          ),
          BlocProvider(
            create: (context) => HistoryBloc(
              context.read<LocalDatabase>(),
            )..add(HistoryCallEvent()),
          ),
        ],
        child: const MyApp(),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        ScreenUtil.init(context);
        return MaterialApp(
          theme: ThemeData(
            useMaterial3: true,
          ),
          debugShowCheckedModeBanner: false,
          home: child,
        );
      },
      child: HomeScreen(),
    );
  }
}
