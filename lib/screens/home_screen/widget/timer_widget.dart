import 'dart:async';
import 'package:default_project/data/local/varibals.dart';
import 'package:default_project/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

class TimerWidget extends StatefulWidget {
  const TimerWidget({
    super.key,
    required this.width,
    required this.height,
    required this.fontSize,
    required this.color,
    required this.start,
  });

  final double width;
  final double height;
  final double fontSize;
  final Color color;
  final bool start;

  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  late Timer _timer;

  void startTimer() {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        if (widget.start) {
          setState(() => puzzleSecond++);
        }
      },
    );
  }

  String printDuration() {
    var duration = Duration(seconds: puzzleSecond);
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            printDuration(),
            style: TextStyle(
              fontSize: widget.fontSize,
              color: widget.color,
            ),
          ),
          const SizedBox(width: 8),
          Icon(
            Icons.timer,
            color: widget.color,
            size: widget.fontSize * 1.3,
          )
        ],
      ),
    );
  }
}
