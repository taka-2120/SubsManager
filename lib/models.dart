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

class SubsAddModel with ChangeNotifier {
  DateTime _date = DateTime.now();

  set date(newValue) {
    _date = newValue;
    notifyListeners();
  }

  DateTime get date => _date;
}

class NotificationsModel with ChangeNotifier {
  bool _enabled = false;

  set enabled(newValue) {
    _enabled = newValue;
    notifyListeners();
  }

  bool get enabled => _enabled;
}
