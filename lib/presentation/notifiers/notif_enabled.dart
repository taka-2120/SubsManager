import 'package:hooks_riverpod/hooks_riverpod.dart';

final notifEnabledProvider =
    StateNotifierProvider<NotifEnabled, bool>((ref) => NotifEnabled(false));

class NotifEnabled extends StateNotifier<bool> {
  NotifEnabled(initial) : super(initial ?? false);

  void update(bool value) {
    state = value;
  }
}
