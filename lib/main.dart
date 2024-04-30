import 'package:default_project/blocs/connectivity/connectivity_bloc.dart';
import 'package:default_project/blocs/connectivity/connectivity_event.dart';
import 'package:default_project/cubits/connectivity/connectivity_cubit_singl.dart';
import 'package:default_project/cubits/currensy_singl/currency_cubit_singl.dart';
import 'package:default_project/data/network/api_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'screens/currensy_cubit_singl_screen/currensy_cubit_singl_screen.dart';

void main(List<String> args) {
  ApiProvider.getCurrency();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CurrencyCubitSingl()..callCurrency()),
        BlocProvider(
            create: (_) => ConnectivityBloc()..add(CheckConnectivity()))
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
      child: const CurrencyCubitSinglScreen(),
    );
  }
}
