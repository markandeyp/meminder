import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:meminder/app.dart';
import 'package:meminder/schemas/item.dart';
import 'package:realm/realm.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MEMinderApp.notificationsPlugin = await initNotifications();
  Configuration config = Configuration.local([Item.schema]);
  Realm realm = Realm(config);
  MEMinderApp.realm = realm;
  runApp(const MEMinderApp());
}

Future<FlutterLocalNotificationsPlugin> initNotifications() async {
  final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();
  const MacOSInitializationSettings macOSSettings =
      MacOSInitializationSettings();
  const InitializationSettings notificationSettings =
      InitializationSettings(macOS: macOSSettings);
  final initResult = await notificationsPlugin.initialize(notificationSettings,
      onSelectNotification: onNotificationTap);
  if (kDebugMode) {
    print('Notification init result: $initResult');
  }

  return notificationsPlugin;
}

onNotificationTap(String? payload) {
  if (kDebugMode) {
    print('Notification tapped $payload');
  }
}
