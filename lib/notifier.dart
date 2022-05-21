import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SubDate extends StateNotifier<DateTime> {
  SubDate() : super(DateTime.now());

  void update(DateTime newDate) {
    state = newDate;
  }
}

class SubPeriod extends StateNotifier<String> {
  SubPeriod() : super("");

  void update(String value) {
    state = value;
  }
}

class NotificationsModel with ChangeNotifier {
  bool _enabled = false;

  set enabled(newValue) {
    _enabled = newValue;
    notifyListeners();
  }

  bool get enabled => _enabled;
}

class TabIndex extends StateNotifier<int> {
  TabIndex(initial) : super(initial ?? 0);

  void update(int index) {
    state = index;
  }
}
