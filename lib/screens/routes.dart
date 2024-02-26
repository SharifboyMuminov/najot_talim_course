import 'package:default_project/screens/index/add/add_screen.dart';
import 'package:default_project/screens/index/home/home_screen.dart';
import 'package:default_project/screens/intro/onboading/onboading_screen.dart';
import 'package:default_project/screens/intro/splash/splash_screen.dart';
import 'package:default_project/screens/intro/start/start_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutName.splashScreen:
        return MaterialPageRoute(
          builder: (contex) {
            return const SplashScreen();
          },
        );
      case RoutName.onBoadingScreen:
        return MaterialPageRoute(
          builder: (contex) {
            return const OnboadingScreen();
          },
        );
      case RoutName.startScreen:
        return MaterialPageRoute(
          builder: (contex) {
            return const StartScreen();
          },
        );

      case RoutName.homeScreen:
        return MaterialPageRoute(
          builder: (contex) {
            return const HomeScreen();
          },
        );

      case RoutName.addScreen:
        return MaterialPageRoute(
          builder: (contex) {
            return const AddScreen();
          },
        );

      default:
        return navigate(
          const Scaffold(
            body: Center(
              child: Text("This kind of rout does not exist!"),
            ),
          ),
        );
    }
  }

  static navigate(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}

class RoutName {
  static const String splashScreen = "/";
  static const String onBoadingScreen = "/onboading";
  static const String startScreen = "/start_screen";
  static const String homeScreen = "/home_screen";
  static const String addScreen = "/add_screen";
}
