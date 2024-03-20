import 'package:default_project/screens/login/login_screen.dart';
import 'package:default_project/screens/tabbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animationSize;

  @override
  void initState() {
    _init();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    animationSize = Tween<double>(begin: 10.0, end: 300.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.bounceIn,
      ),
    )..addListener(() {
        setState(() {});
      });
    animationController.forward();

    super.initState();
  }

  _init() async {
    await Future.delayed(
      const Duration(seconds: 3),
    );
    if (!mounted) return;

    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return LoginScreen();
          },
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return TabScreen();
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(
          "assets/icons/time.svg",
          width: animationSize.value,
        ),
      ),
    );
  }
}
