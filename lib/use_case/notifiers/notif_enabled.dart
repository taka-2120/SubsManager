import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:subsmanager/use_case/notif_services.dart';

final notifEnabledProvider =
    StateNotifierProvider<NotifEnabled, bool>((ref) => NotifEnabled(false));

class NotifEnabled extends StateNotifier<bool> {
  NotifEnabled(initial) : super(initial ?? false);

  void update(bool value) async {
    state = value;
    switch (value) {
      case false:
        await cancelAllNotif();
        break;
      case true:
        //Reschedule
        break;
    }
  }
}
