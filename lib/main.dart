import 'package:default_project/data/reposotory/book_repository/book_repository.dart';
import 'package:default_project/views/book_view_model/book_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'screens/home/home_screen.dart';

void main(List<String> args) {
  BookRepository bookRepository = BookRepository();





  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => BookViewModel(
            bookRepository: bookRepository,
          ),
          
        ),
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
      designSize: const Size(393, 852),
      builder: (context, child) {
        ScreenUtil.init(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(useMaterial3: false),
          home: child,
        );
      },
      child: const HomeScreen(),
    );
  }
}
