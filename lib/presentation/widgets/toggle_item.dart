import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../theme.dart';
import '../notifiers/notif_enabled.dart';

Widget notifToggleItem(String title, WidgetRef ref) {
  final notifEnabled = ref.watch(notifEnabledProvider);
  final readNotifEnabled = ref.read(notifEnabledProvider.notifier);

  return Container(
    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
    decoration: BoxDecoration(
      border: Border.all(color: borderColor),
      borderRadius: BorderRadius.circular(15),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        Switch.adaptive(
          value: notifEnabled,
          onChanged: readNotifEnabled.update,
          activeTrackColor: Colors.lightGreenAccent,
          activeColor: Colors.green,
        )
      ],
    ),
  );
}
