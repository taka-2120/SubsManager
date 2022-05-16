import 'package:flutter/material.dart';

class TabModel with ChangeNotifier {
  int _currentIndex = 0;

  set currentIndex(newValue) {
    _currentIndex = newValue;
    notifyListeners();
  }

  int get currentIndex => _currentIndex;

  void onTapped(int index) {
    currentIndex = index;
  }
}
