import 'package:default_project/moduls/data_repo.dart';
import 'package:default_project/screens/home_screen/home_screen.dart';
import 'package:default_project/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

class SplashCreen extends StatefulWidget {
  const SplashCreen({super.key});

  @override
  State<SplashCreen> createState() => _SplashCreenState();
}

class _SplashCreenState extends State<SplashCreen> {
  @override
  void initState() {
    DataRepository.instanse.connectJson();
    Future.delayed(
      const Duration(milliseconds: 2500),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const HomeScreen();
            },
          ),
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        systemNavigationBarColor: AppColors.c_252525,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
        statusBarColor: AppColors.c_252525,
      ),
      child: Scaffold(
        backgroundColor: AppColors.c_252525,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Lottie.asset("assets/lottie/splash_animetion.json")],
        ),
      ),
    );
  }
}
