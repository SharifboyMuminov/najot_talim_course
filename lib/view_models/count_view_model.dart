import 'package:flutter/material.dart';

class CountViewModel extends ChangeNotifier {
  int count = 0;

  Future<void> increment() async {
    while (true) {
      await Future.delayed(const Duration(seconds: 1));
      count++;
      notifyListeners();
    }
  }
}
