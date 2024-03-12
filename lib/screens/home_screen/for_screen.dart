import 'package:flutter/material.dart';

class ForScreen extends StatefulWidget {
  const ForScreen({super.key});

  @override
  State<ForScreen> createState() => _ForScreenState();
}

class _ForScreenState extends State<ForScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation animationWidthe;
  late Animation animationHeight;
  late Animation animationColor;
  late Animation animationBorder;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));

    animationWidthe = TweenSequence<double>(
      [
        TweenSequenceItem<double>(
            tween: Tween(begin: 100, end: 40), weight: 20),
        TweenSequenceItem<double>(
            tween: Tween(begin: 40, end: 300), weight: 20),
        TweenSequenceItem<double>(
            tween: Tween(begin: 300, end: 150), weight: 20),
      ],
    ).animate(animationController);
    animationHeight = TweenSequence<double>(
      [
        TweenSequenceItem<double>(
            tween: Tween(begin: 100, end: 250), weight: 20),
        TweenSequenceItem<double>(
            tween: Tween(begin: 250, end: 100), weight: 20),
      ],
    ).animate(animationController);
    animationColor = ColorTween(begin: Colors.green, end: Colors.blue)
        .animate(animationController);
    animationBorder = BorderRadiusTween(
            begin: BorderRadius.circular(10), end: BorderRadius.circular(30))
        .animate(animationController);
    animationController.forward();

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
          child: Container(
            width: animationWidthe.value,
            height: animationHeight.value,
            decoration: BoxDecoration(
                color: animationColor.value,
                borderRadius: animationBorder.value),
          ),
        ),
        floatingActionButton: TextButton(
          style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              backgroundColor: Colors.blue,
              shape: const CircleBorder()),
          onPressed: () {
            animationController.reverse();
          },
          child: const Icon(
            Icons.play_arrow,
            color: Colors.white,
            size: 33,
          ),
        ));
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
