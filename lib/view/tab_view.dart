import 'package:flutter/foundation.dart';

class TabViewModel extends ChangeNotifier {
  int _activeIndexScreen = 0;

  get activeScreen => _activeIndexScreen;

  void setActiveScreen(int v) {
    _activeIndexScreen = v;
    notifyListeners();
  }
}
