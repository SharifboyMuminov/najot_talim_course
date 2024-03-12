import 'package:flutter/material.dart';

class ThreeScreen extends StatefulWidget {
  const ThreeScreen({super.key});

  @override
  State<ThreeScreen> createState() => _ThreeScreenState();
}

class _ThreeScreenState extends State<ThreeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation animationColor;
  late Animation animationBorder;
  late Animation<Widget> animationText;
  late Animation animationSize;
  late TextStyle textStyle;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));

    animationColor = ColorTween(begin: Colors.orange, end: Colors.green)
        .animate(animationController);
    animationBorder = BorderRadiusTween(
            begin: BorderRadius.circular(5), end: BorderRadius.circular(25))
        .animate(animationController);
    animationSize =
        Tween<double>(begin: 20, end: 70.0).animate(animationController);
    textStyle = TextStyle(fontSize: animationSize.value);

    animationText = TweenSequence<Widget>([
      TweenSequenceItem(
          tween: ConstantTween(Text(
            "^...^",
            style: textStyle,
          )),
          weight: 10),
      TweenSequenceItem(
          tween: ConstantTween(const Text(
            "Hello",
            style: TextStyle(fontSize: 18),
          )),
          weight: 20),
      TweenSequenceItem(
          tween:
              ConstantTween(const Text("My", style: TextStyle(fontSize: 20))),
          weight: 20),
      TweenSequenceItem(
          tween:
              ConstantTween(const Text("Name", style: TextStyle(fontSize: 22))),
          weight: 20),
      TweenSequenceItem(
          tween: ConstantTween(
              const Text("Sharifjon", style: TextStyle(fontSize: 25))),
          weight: 30),
    ]).animate(animationController);

    animationController.addListener(() => setState(() {}));

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
            Container(
              width: 300,
              height: 300,
              child: Center(child: animationText.value),
              decoration: BoxDecoration(
                  color: animationColor.value,
                  borderRadius: animationBorder.value),
            ),
            TextButton(
              onPressed: () {
                animationController.forward();
              },
              child: const Text("Clic me", style: TextStyle(fontSize: 20)),
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
