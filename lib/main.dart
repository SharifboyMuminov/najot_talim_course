import 'package:default_project/blocs/country/country_bloc.dart';
import 'package:default_project/blocs/country/country_event.dart';
import 'package:default_project/data/api_client/api_client.dart';
import 'package:default_project/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();

  ApiClient apiClient = ApiClient.create();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CountryBloc(apiClient: apiClient)),
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
      child: HomeScreen(),
    );
  }
}
