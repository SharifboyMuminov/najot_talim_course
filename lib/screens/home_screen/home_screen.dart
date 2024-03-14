import 'dart:math';

import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation cirkl;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    cirkl = Tween<double>(begin: 0, end: 6.5).animate(animationController);
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
        child: Column(
          children: [
            Container(
              color: Colors.blue,
              child: CustomPaint(
                size: Size(100, 150),
                painter: MyPainterOne(),
              ),
            ),
            SizedBox(height: 10),
            Container(
              color: Colors.grey.shade100,
              child: CustomPaint(
                size: Size(100, 150),
                painter: MyPainterTwo(),
              ),
            ),
            SizedBox(height: 10),
            Container(
              color: Colors.grey.shade100,
              child: CustomPaint(
                size: Size(100, 100),
                painter: MyPainterThree(),
              ),
            ),
            SizedBox(height: 10),
            Container(
              color: Colors.grey.shade100,
              child: CustomPaint(
                size: Size(100, 100),
                painter: MyPainterFor(),
              ),
            ),
            SizedBox(height: 10),
            Container(
              color: Colors.grey.shade100,
              child: CustomPaint(
                size: Size(200, 200),
                painter: MyPainterFive(son: cirkl.value),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyPainterFive extends CustomPainter {
  MyPainterFive({required this.son});
  final double son;

  @override
  void paint(Canvas canvas, Size size) {
    final centr = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 2, size.height / 2);
    canvas.drawArc(
      Rect.fromCenter(center: centr, width: 150, height: 150),
      5,
      son,
      false,
      Paint(),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class MyPainterFor extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final centr = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 2, size.height / 2);
    Path path = Path();

    path.lineTo(0, size.height * 0.65);

    path.quadraticBezierTo(
      size.width * 0.2,
      size.height * 0.5,
      size.width * 0.5,
      size.height * 0.5,
    );
    path.quadraticBezierTo(
      size.width * 0.8,
      size.height * 0.5,
      size.width,
      size.height * 0.65,
    );
    path.lineTo(size.width, 0);
    path.close();

    canvas.drawPath(path, Paint());
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class MyPainterThree extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final centr = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 2, size.height / 2);
    canvas.drawCircle(
        centr,
        radius,
        Paint()
          ..color = Colors.blue
          ..style = PaintingStyle.stroke
          ..strokeWidth = 5);

    canvas.drawCircle(Offset(centr.dx / 2, centr.dy - radius / 2), 10,
        Paint()..color = Colors.blue);
    canvas.drawCircle(Offset(2.9 * (centr.dx / 2), centr.dy - radius / 2), 10,
        Paint()..color = Colors.blue);

    canvas.drawLine(
        Offset(size.width / 3, size.height / 2),
        Offset(size.width / 1.5, size.height / 2),
        Paint()
          ..color = Colors.blue
          ..strokeWidth = 3);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class MyPainterTwo extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final centr = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 2, size.height / 2);
    canvas.drawCircle(
        centr,
        radius,
        Paint()
          ..color = Colors.yellow
          ..style = PaintingStyle.stroke
          ..strokeWidth = 5);

    canvas.drawCircle(Offset(centr.dx / 2, centr.dy - radius / 2), 10,
        Paint()..color = Colors.yellow);
    canvas.drawCircle(Offset(2.9 * (centr.dx / 2), centr.dy - radius / 2), 10,
        Paint()..color = Colors.yellow);

    canvas.drawArc(
        Rect.fromCircle(center: centr, radius: radius / 2),
        0,
        pi,
        false,
        Paint()
          ..style = PaintingStyle.fill
          ..strokeWidth = 2
          ..color = Colors.yellow);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class MyPainterOne extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final centr = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 2, size.height / 2);
    canvas.drawCircle(centr, radius, Paint()..color = Colors.yellow);

    canvas.drawCircle(Offset(centr.dx / 2, centr.dy - radius / 2), 10, Paint());
    canvas.drawCircle(
        Offset(2.9 * (centr.dx / 2), centr.dy - radius / 2), 10, Paint());

    canvas.drawArc(
        Rect.fromCircle(center: centr, radius: radius / 2),
        0,
        pi,
        false,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
