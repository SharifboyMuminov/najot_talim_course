import 'package:default_project/utils/size.dart';
import 'package:default_project/view_models/puzzle/puzzle_view_model.dart';
import 'package:default_project/screens/home_screen/widget/timer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'widget/puzzel_button.dart';
import 'widget/start_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Slide Puzzle",
          style: TextStyle(
            color: Colors.deepPurple,
            fontSize: 26.sp,
            fontWeight: FontWeight.w800,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.read<PuzzleView>().shuffleNumbers();
            },
            icon: Icon(
              Icons.restart_alt,
              size: 25.sp,
              color:  Colors.deepPurple,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 50.he),
          TimerWidget(
            width: 200,
            height: 100,
            fontSize: 22.sp,
            color: Colors.deepPurple,
            start: context.watch<PuzzleView>().isStart,
          ),
          SizedBox(height: 50.he),
          const PuzzleButtons(),
          const Spacer(),
          const StartButton(),
        ],
      ),
    );
  }
}
