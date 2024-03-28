import 'package:default_project/screens/home_screen/home_screen.dart';
import 'package:default_project/screens/widgets/my_navigator.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {

    Future.delayed(const Duration(seconds: 2),(){
      myNavigatorPush(context, widget: HomeScreen());
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Text(
          "Hello",
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 35.sp,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
