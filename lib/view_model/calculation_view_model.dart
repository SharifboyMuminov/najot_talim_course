import 'package:dart_eval/dart_eval.dart' as calculator;
import 'package:flutter/cupertino.dart';

class CalculatorViewModel extends ChangeNotifier {
  String text = "";
  String result = "";

  void addText(String tex) {
    text = text + tex;
    notifyListeners();
  }

  void natija() {
    result = calculator.eval(text).toString();
    notifyListeners();
  }

  void clearText() {
    text = "";
    result = "";
    notifyListeners();
  }

  void deleteOne() {
    text = text.substring(0,text.length-1);
    notifyListeners();
  }
}
