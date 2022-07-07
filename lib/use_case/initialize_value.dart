import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:subsmanager/use_case/notifiers/notif_date.dart';
import 'package:subsmanager/use_case/notifiers/notif_enabled.dart';
import 'package:subsmanager/use_case/notifiers/notif_time.dart';
import 'package:subsmanager/use_case/notifiers/sort_option.dart';
import 'package:subsmanager/use_case/sub_value/notifier/sub_value_notifier.dart';
import 'package:subsmanager/use_case/user_data/notifier/user_data.dart';
import 'package:subsmanager/use_case/subs_list/notifier/subs_list_notifier.dart';

class InitializeValue {
  void init(BuildContext context, WidgetRef ref) {
    ref.read(notifEnabledProvider.notifier).update(false);
    ref.read(notifDateProvider.notifier).update(3);
    ref.read(notifTimeProvider.notifier).update(TimeOfDay.now());
    ref.read(sortOptionProvider.notifier).update(ref, 0);
    ref.read(userDataProvider.notifier).init();
    ref.read(subValueNotifierProvider.notifier).init();
    ref.read(subsListNotifierProvider.notifier).init();
  }
}
