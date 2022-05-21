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

class NotifEnabled extends StateNotifier<bool> {
  NotifEnabled(initial) : super(initial ?? false);

  void update(bool value) {
    state = value;
  }
}

class TabIndex extends StateNotifier<int> {
  TabIndex(initial) : super(initial ?? 0);

  void update(int index) {
    state = index;
  }
}
