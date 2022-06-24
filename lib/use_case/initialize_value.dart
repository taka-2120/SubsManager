import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:subsmanager/use_case/notifiers/notif_date.dart';
import 'package:subsmanager/use_case/notifiers/notif_enabled.dart';
import 'package:subsmanager/use_case/notifiers/notif_time.dart';
import 'package:subsmanager/use_case/notifiers/sort_option.dart';
import 'package:subsmanager/use_case/notifiers/sub_value.dart';
import 'package:subsmanager/use_case/notifiers/subs_list.dart';
import 'package:subsmanager/use_case/notifiers/tab_index.dart';
import 'package:subsmanager/use_case/notifiers/user_data.dart';

class InitializeValue {
  void init(BuildContext context, WidgetRef ref) {
    ref.read(notifEnabledProvider.notifier).update(false);
    ref.read(notifDateProvider.notifier).update(3);
    ref.read(notifTimeProvider.notifier).update(TimeOfDay.now());
    ref.read(sortOptionProvider.notifier).update(ref, 0);
    ref.read(userDataProvider.notifier).init();
    ref.read(tabIndexProvider.notifier).update(0);
    ref.read(subValueProvider.notifier).init();
    ref.read(subsListProvider.notifier).init();
  }
}
