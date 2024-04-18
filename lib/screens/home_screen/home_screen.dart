import 'package:default_project/utils/size.dart';
import 'package:default_project/view_models/puzzle/puzzle_view_model.dart';
import 'package:default_project/widget/timer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

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
          ...List.generate(
            context.watch<PuzzleView>().puzzleNumbers.length,
            (index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                    context.watch<PuzzleView>().puzzleNumbers[index].length,
                    (indexTwo) {
                      if (context.watch<PuzzleView>().puzzleNumbers[index]
                              [indexTwo] ==
                          0) {
                        return Container(
                          height: 80.we,
                          width: 80.we,
                          margin: EdgeInsets.symmetric(
                              horizontal: 5.we, vertical: 5.he),
                        );
                      }
                      return TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                        onPressed: () {
                          context.read<PuzzleView>().changeNumbers(context,
                              index: index, indexTwo: indexTwo);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 80.we,
                          width: 80.we,
                          margin: EdgeInsets.symmetric(
                              horizontal: 5.we, vertical: 5.he),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: Colors.deepPurple.withOpacity(0.6),
                          ),
                          child: Text(
                            context
                                .watch<PuzzleView>()
                                .puzzleNumbers[index][indexTwo]
                                .toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 22.sp,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              );
            },
          ),
          const Spacer(),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 20.we, vertical: 30.he),
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
          ),
        ],
      ),
    );
  }
}
