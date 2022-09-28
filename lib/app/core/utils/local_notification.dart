import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


void myLocalNotification({
  String? title,
  String? body,
  required Map<String, dynamic> payload,
}) async {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings("@mipmap/launcher_icon");

  const IOSInitializationSettings initializationSettingsIOS =
      IOSInitializationSettings(
    requestSoundPermission: false,
    requestBadgePermission: false,
    requestAlertPermission: false,
  );
  const MacOSInitializationSettings initializationSettingsMacOS =
      MacOSInitializationSettings(
    requestAlertPermission: false,
    requestBadgePermission: false,
    requestSoundPermission: false,
  );
  const InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,
    macOS: initializationSettingsMacOS,
  );

  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
    onSelectNotification: selectNotification,
  );

  const AndroidNotificationDetails notificationAndroidSpecifics =
      AndroidNotificationDetails(
    "3",
    "groupChannelName",
    channelDescription: "groupChannelDescription",
    playSound: false,
    importance: Importance.max,
    priority: Priority.high,
    groupKey: "100",
  );

  const NotificationDetails notificationPlatformSpecifics =
      NotificationDetails(android: notificationAndroidSpecifics);
  await flutterLocalNotificationsPlugin.show(
    3,
    title,
    body,
    notificationPlatformSpecifics,
    payload: json.encode(payload),
  );
}

Future<void> selectNotification(String? payload) async {
  if (payload == null) {
    debugPrint('notification payload: $payload');
    return;
  }
  // Get.toNamed(Routes.NOTIFICATION);
}
