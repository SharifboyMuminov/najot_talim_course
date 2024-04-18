import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PuzzleView extends ChangeNotifier {
  PuzzleView() {
    shuffleNumbers();
  }

  List<List<int>> puzzleNumbers = [];
  List<int> randomNumbers = List.generate(15, (index) => index + 1);
  bool _isStart = false;

  void shuffleNumbers() {
    puzzleNumbers = [];
    int start = 0;

    randomNumbers.shuffle();
    for (int i = 0; i < 4; i++) {
      List<int> lst = [];
      for (int j = start; j < start + 4; j++) {
        if (j < randomNumbers.length) {
          lst.add(randomNumbers[j]);
        } else {
          lst.add(0);
        }
      }
      start += 4;
      puzzleNumbers.add(lst);
    }
    notifyListeners();
    // debugPrint(puzzleNumbers.toString());
  }

  bool get isStart => _isStart;

  void changeStart() {
    _isStart = !_isStart;
    notifyListeners();
  }
  void changeValueStart(bool value){
    _isStart = value;
    notifyListeners();
  }

  void changeNumbers(BuildContext context,
      {required int index, required int indexTwo}) {
    if (isStart) {
      if (index - 1 >= 0 && puzzleNumbers[index - 1][indexTwo] == 0) {
        puzzleNumbers[index - 1][indexTwo] = puzzleNumbers[index][indexTwo];
        puzzleNumbers[index][indexTwo] = 0;
      } else if (index + 1 < puzzleNumbers.length &&
          puzzleNumbers[index + 1][indexTwo] == 0) {
        puzzleNumbers[index + 1][indexTwo] = puzzleNumbers[index][indexTwo];
        puzzleNumbers[index][indexTwo] = 0;
      } else if (indexTwo - 1 >= 0 && puzzleNumbers[index][indexTwo - 1] == 0) {
        puzzleNumbers[index][indexTwo - 1] = puzzleNumbers[index][indexTwo];
        puzzleNumbers[index][indexTwo] = 0;
      } else if (indexTwo + 1 < puzzleNumbers.last.length &&
          puzzleNumbers[index][indexTwo + 1] == 0) {
        puzzleNumbers[index][indexTwo + 1] = puzzleNumbers[index][indexTwo];
        puzzleNumbers[index][indexTwo] = 0;
      }

      notifyListeners();
      if (isWin()) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog.adaptive(
              title: Text(
                'The end :)',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              content: Text(
                'Congrats on the win :)',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    shuffleNumbers();
                    Navigator.of(context).pop();
                  },
                  child: Text('Close'),
                ),
              ],
            );
          },
        );
      }
    }
  }

  bool isWin() {
    List<List<int>> trueNumbers = [
      [1, 2, 3, 4],
      [5, 6, 7, 8],
      [9, 10, 11, 12],
      [13, 14, 15, 0],
    ];
    int trueCount = 0;

    for (int i = 0; i < trueNumbers.length; i++) {
      for (int j = 0; j < trueNumbers[i].length; j++) {
        if (trueNumbers[i][j] == puzzleNumbers[i][j]) {
          trueCount++;
        }
      }
    }
    return trueCount == trueNumbers.length;
  }
}
