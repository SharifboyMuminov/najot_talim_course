import 'package:default_project/cubits/image/image_cubit.dart';
import 'package:default_project/cubits/message/message_cubit.dart';
import 'package:default_project/cubits/user/user_cubit.dart';
import 'package:default_project/screens/regestr/login_screen.dart';
import 'package:default_project/server/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'data/local/storage_repository.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  StorageRepository();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => MessageCubit()),
        BlocProvider(create: (_) => UserCubit()..callUser()),
        BlocProvider(create: (_) => ImageCubit()),
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
      designSize: const Size(375, 812),
      builder: (context, child) {
        ScreenUtil.init(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(useMaterial3: true),
          home: child,
        );
      },
      child: const LoginScreen(),
    );
  }
}
