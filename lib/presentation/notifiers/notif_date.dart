import 'package:hooks_riverpod/hooks_riverpod.dart';

final notifDateProvider =
    StateNotifierProvider<NotifDate, int>((ref) => NotifDate(3));

class NotifDate extends StateNotifier<int> {
  NotifDate(initial) : super(initial ?? 3);

  void update(int value) {
    state = value;
  }
}
