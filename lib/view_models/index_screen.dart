import 'package:flutter/cupertino.dart';

class ActiveIndexScreen extends ChangeNotifier {
  int _activeIndex = 0;

  int get activeIndex => _activeIndex;

  chaneIndex(int v) {
    _activeIndex = v;
  }
}
