import 'package:default_project/utils/size.dart';
import 'package:default_project/view_models/puzzle/puzzle_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class PuzzleButtons extends StatelessWidget {
  const PuzzleButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
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
    );
  }
}
