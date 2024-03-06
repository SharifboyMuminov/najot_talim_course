import 'package:default_project/screens/home_screen/home_screen.dart';
import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/size.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      _pushHomeScreen();
    });
    super.initState();
  }

  _pushHomeScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return HomeScreen();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        color: Color(0xFF0C0F14),
        child: Column(
          children: [
            Image.asset("assets/images/splash_iamge.jpg"),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.we),
              child: Text(
                "splash_screen.title".tr(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.c_FFFFFF,
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Spacer(),
            TextButton(
              style: TextButton.styleFrom(
                  padding:
                      EdgeInsets.symmetric(horizontal: 32.we, vertical: 16.he),
                  backgroundColor: AppColors.c_FFFFFF.withOpacity(0.10)),
              onPressed: () {
                _pushHomeScreen();
              },
              child: Text(
                "splash_screen.button_text".tr(),
                style: TextStyle(
                  color: AppColors.c_FFFFFF,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            64.getH(),
          ],
        ),
      ),
    );
  }
}
