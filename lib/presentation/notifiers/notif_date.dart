import 'package:hooks_riverpod/hooks_riverpod.dart';

final notifDateProvider =
    StateNotifierProvider<NotifDate, int>((ref) => NotifDate(0));

class NotifDate extends StateNotifier<int> {
  NotifDate(initial) : super(initial ?? 0);

  void update(int value) {
    state = value;
  }
}
