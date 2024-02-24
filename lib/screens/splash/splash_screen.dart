import 'package:default_project/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../control_screen.dart';

class SplashCreen extends StatefulWidget {
  const SplashCreen({super.key});

  @override
  State<SplashCreen> createState() => _SplashCreenState();
}

class _SplashCreenState extends State<SplashCreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const ControlScreen();
          },
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.c_000000,
      body: Center(
        child: Lottie.asset("assets/lotties/splash.json"),
      ),
    );
  }
}
