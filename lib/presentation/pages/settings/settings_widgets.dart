import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../globals.dart';
import '../../notifiers/notif_enabled.dart';

Widget settingsItem(BuildContext context, Icon icon, String left, String right,
    bool navigatable,
    {StatelessWidget? destination}) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
    decoration: BoxDecoration(
      border: Border.all(color: borderColor),
      borderRadius: BorderRadius.circular(15),
    ),
    child: InkWell(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                icon,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(left),
                ),
              ],
            ),
            navigatable ? const Icon(Icons.arrow_right) : Text(right)
          ],
        ),
      ),
      onTap: () {
        if (navigatable) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => destination!),
          );
        }
      },
    ),
  );
}

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
