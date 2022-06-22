import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final notifTimeProvider = StateNotifierProvider<NotifTime, TimeOfDay>(
    (ref) => NotifTime(TimeOfDay.now()));

class NotifTime extends StateNotifier<TimeOfDay> {
  NotifTime(initial) : super(initial ?? TimeOfDay.now());

  void update(TimeOfDay time) {
    state = time;
  }
}
