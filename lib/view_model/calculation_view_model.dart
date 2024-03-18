import 'package:dart_eval/dart_eval.dart' as calculator;
import 'package:flutter/cupertino.dart';

class CalculatorViewModel extends ChangeNotifier {
  String text = "";
  String result = "";
  String errorText = "";

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
    text = text.substring(0, text.length - 1);
    notifyListeners();
  }

  void manualNatija() {
    bool isConfirmation = true;

    double son = 0.0;
    String amal = "";
    String numbers1 = "";
    String numbers2 = "";

    for (int i = 0; i < text.length; i++) {
      if (i == text.length - 1) {
        numbers2 = numbers2 + text[i];

        if (numbers2.isNotEmpty && numbers1.isNotEmpty) {
          son = calculat(numbers1, numbers2, amal);
        }
      }
      if (isConfirmation && "1234567890.".contains(text[i])) {
        numbers1 = numbers1 + text[i];
      } else if ("%*/+-".contains(text[i])) {
        amal = text[i];
        isConfirmation = !isConfirmation;
      } else if ("1234567890.".contains(text[i])) {
        numbers2 = numbers2 + text[i];
      } else {
        errorText = "Unaqa masde ;)";
        notifyListeners();
        return;
      }
    }
    result = son.toString();
    notifyListeners();
  }

  double calculat(String text1, String text2, String amal) {
    switch (amal) {
      case "-":
        return double.parse(text1) - double.parse(text2);
      case "+":
        return double.parse(text1) + double.parse(text2);
      case "*":
        return double.parse(text1) * double.parse(text2);
      case "%":
        return double.parse(text1) - double.parse(text2);
      case "/":
        return double.parse(text1) - double.parse(text2);
      default:
        return 0;
    }
  }
}
