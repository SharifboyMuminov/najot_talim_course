import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:default_project/screens/splash/splash_screen.dart';
import 'package:default_project/utils/app_them.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'data/local/storage_repository.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageRepository.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 739),
      builder: (context, child) {
        ScreenUtil.init(context);
        return AdaptiveTheme(
          light: AppTheme.lightTheme,
          dark: AppTheme.darkTheme,
          initial: AdaptiveThemeMode.light,
          builder: (light, dark) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: light,
              home: child,
            );
          },
        );
      },
      child: const SplashScreen(),
    );
  }
}
