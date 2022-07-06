import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:subsmanager/domain/subs_list/models/sub_item.dart';
import 'package:subsmanager/extensions/date_ext.dart';
import 'package:subsmanager/extensions/fee_double_str.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationServices {
  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  static final _notificationService = NotificationServices._internal();

  factory NotificationServices() {
    return _notificationService;
  }

  NotificationServices._internal();

  Future<void> init() async {
    const initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');

    const initializationSettingsIOS = IOSInitializationSettings(
      requestSoundPermission: true,
      requestBadgePermission: true,
      requestAlertPermission: true,
    );

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    tz.initializeTimeZones();

    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: selectNotification);
  }

  Future selectNotification(String? payload) async {
    //Handle notification tapped logic here
  }

  Future<void> cancelNotifications(int notifId) async {
    await flutterLocalNotificationsPlugin.cancel(notifId);
  }

  Future<void> setNotification(SubItem subItem, BuildContext context) async {
    tz.initializeTimeZones();
    await flutterLocalNotificationsPlugin.zonedSchedule(
      subItem.id.hashCode,
      "SubsManager - The Billing Date Approaching",
      "The billing date for ${subItem.name}'s ${subItem.fee.feeToString(currency: true)} is ${subItem.date!.dateToString(context)}.",
      tz.TZDateTime.now(tz.local).add(const Duration(seconds: 30)),
      const NotificationDetails(
        android: AndroidNotificationDetails(
          "yu-takahashi.subsmanager",
          "SubsManager",
          channelDescription: "Subsscription Manager",
        ),
      ),
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }
}
