import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:subsmanager/theme.dart';
import 'package:subsmanager/use_case/notifiers/notif_enabled.dart';

class ToggleItem extends ConsumerWidget {
  const ToggleItem(this.title, {Key? key}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            onChanged: readNotifEnabled.updateNotifState,
            activeTrackColor: Colors.lightGreenAccent,
            activeColor: Colors.green,
          )
        ],
      ),
    );
  }
}
