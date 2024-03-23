import 'package:default_project/screens/login/login_screen.dart';
import 'package:default_project/screens/tabbar.dart';
import 'package:default_project/utils/size.dart';
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
  late Animation<Alignment> animationAlign;

  @override
  void initState() {
    _init();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    animationAlign =
        Tween<Alignment>(begin: Alignment.topCenter, end: Alignment.center)
            .animate(
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
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    // context.read<CategoryViewModel>().getCategories();

    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: animationAlign.value,
            child: SvgPicture.asset(
              "assets/icons/basket.svg",
              width: 200.we,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
