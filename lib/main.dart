import 'package:default_project/screens/splash/splash_screen.dart';
import 'package:default_project/view_models/index_screen.dart';
import 'package:default_project/view_models/location.dart';
import 'package:default_project/view_models/maps_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'view_models/save_location.dart';

void main(List<String> args) {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => MapsViewModel()..getUserLocation()),
        ChangeNotifierProvider(create: (_) => ActiveIndexScreen()),
        ChangeNotifierProvider(create: (_) => SaveLocation()..getAllLocation()),
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
          theme: ThemeData(useMaterial3: true),
          home: child,
        );
      },
      child: SplashScreen(),
    );
  }
}
