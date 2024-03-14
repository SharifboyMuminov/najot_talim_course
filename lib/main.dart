import 'package:default_project/data/repository/state_repository.dart';
import 'package:default_project/data/repository/user_repository.dart';
import 'package:default_project/view_models/state_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'screens/contorl.dart';
import 'view_models/user_view_model.dart';

void main(List<String> args) {
  UserRepository userRepository = UserRepository();
  StateRepository stateRepository = StateRepository();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => UserView(userRepository: userRepository)),
        ChangeNotifierProvider(
            create: (_) => StateView(stateRepository: stateRepository)),
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
      child: const ControlScreen(),
    );
  }
}
