import 'package:default_project/screens/home_screen/five_screen.dart';
import 'package:default_project/screens/home_screen/for_screen.dart';
import 'package:default_project/screens/home_screen/one_screen.dart';
import 'package:default_project/screens/home_screen/six_screen.dart';
import 'package:default_project/screens/home_screen/three_screen.dart';
import 'package:default_project/screens/home_screen/two_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RemoteScreen extends StatelessWidget {
  const RemoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const OneScreen();
                    },
                  ),
                );
              },
              child: const Text(
                "One Screen",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const TwoScreen();
                    },
                  ),
                );
              },
              child: const Text(
                "Two Screen",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const ThreeScreen();
                    },
                  ),
                );
              },
              child: const Text(
                "Three Screen",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const ForScreen();
                    },
                  ),
                );
              },
              child: const Text(
                "For Screen",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const FiveScreen();
                    },
                  ),
                );
              },
              child: const Text(
                "Five Screen",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const SixScreen();
                    },
                  ),
                );
              },
              child: const Text(
                "Six Screen",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
