import 'package:default_project/utils/size.dart';
import 'package:default_project/view_models/puzzle/puzzle_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class StartButton extends StatelessWidget {
  const StartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 20.we, vertical: 40.he),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.deepPurple,
        ),
        onPressed: () {
          context.read<PuzzleView>().changeStart();
        },
        child: Text(
          context.watch<PuzzleView>().isStart ? "Stop" : "Start",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 25.sp,
          ),
        ),
      ),
    );
  }
}
