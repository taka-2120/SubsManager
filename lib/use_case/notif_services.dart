import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:subsmanager/domain/subs_list/models/sub_item.dart';
import 'package:subsmanager/extensions/date_ext.dart';
import 'package:subsmanager/extensions/fee_double_str.dart';
import 'package:subsmanager/use_case/notifiers/notif_date.dart';
import 'package:subsmanager/use_case/notifiers/notif_time.dart';

Future<void> _setNotification(Ref ref, MaterialLocalizations locale,
    {required SubItem item, int? month}) async {
  const title = "SubsManager - The Billing Date Approaching";
  final body =
      "The billing date for ${item.name}'s ${item.fee.feeToString(currency: true)} is ${item.date!.dateToString(locale)}.";

  final id = item.id.hashCode;
  const channelKey = "yu-takahashi.subsmanager";

  var notifCalendar = NotificationCalendar(
    month: month,
    day: item.date!.day - ref.read(notifDateProvider.notifier).getDayBefore(),
    hour: ref.read(notifTimeProvider).hour,
    minute: ref.read(notifTimeProvider).minute,
    second: 0,
    repeats: true,
    allowWhileIdle: true,
  );

  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: id,
      channelKey: channelKey,
      title: title,
      body: body,
    ),
    schedule: notifCalendar,
  );
}

Future<void> setNotifByPeriod(Ref ref, MaterialLocalizations locale,
    {required SubItem item}) async {
  switch (item.period) {
    case 0:
      //Monthly
      await _setNotification(ref, locale, item: item);
      break;
    case 1:
      //Semi-Annually
      await _setNotification(ref, locale, item: item, month: item.date!.month);
      await _setNotification(ref, locale,
          item: item, month: item.date!.month + 6);
      break;
    case 2:
      //Annually
      await _setNotification(ref, locale, item: item, month: item.date!.month);

      break;
  }
}

Future<void> cancelNotif(SubItem item) async {
  await AwesomeNotifications().cancel(item.id.hashCode);
}

Future<void> cancelAllNotif() async {
  await AwesomeNotifications().cancelAll();
}
