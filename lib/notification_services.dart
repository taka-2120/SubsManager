import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  static final _notificationService = NotificationService._internal();

  factory NotificationService() {
    return _notificationService;
  }

  NotificationService._internal();

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

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future selectNotification(String payload) async {
    //Handle notification tapped logic here
  }
}
