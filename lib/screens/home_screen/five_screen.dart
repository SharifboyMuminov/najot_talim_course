import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FiveScreen extends StatefulWidget {
  const FiveScreen({super.key});

  @override
  State<FiveScreen> createState() => _FiveScreenState();
}

class _FiveScreenState extends State<FiveScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation animationSize;
  late Animation animationSecond;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    );

    animationSize =
        Tween<double>(begin: 0.0, end: 350.0).animate(animationController);
    animationSecond =
        Tween<double>(begin: 0, end: 100).animate(animationController);

    animationController.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                Container(
                  height: 40,
                  width: 350,
                  color: Colors.blue.withOpacity(0.5),
                ),
                Container(
                  height: 40,
                  width: animationSize.value,
                  color: Colors.blue,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              "${animationSecond.value.toInt()}%",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r)),
              ),
              onPressed: () {
                animationController.forward();
              },
              child: const Text(
                "Animated",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
