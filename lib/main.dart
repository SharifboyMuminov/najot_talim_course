import 'package:default_project/screens/home_screen/info_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/home_screen/home_screen.dart';

SharedPreferences? sharedPreferences;

Future<void> shared() async {
  sharedPreferences = await SharedPreferences.getInstance();
}

void main(List<String> args) {
  shared();
  runApp(MyApp());
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
      child: getString().isEmpty
          ? LoginScreen()
          : HomeScreen(),
    );
  }
}

String getString(){
  if(sharedPreferences != null){
    return sharedPreferences!.getString("email") ?? "";
  }
  return "";
}
