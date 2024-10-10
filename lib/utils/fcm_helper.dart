import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:surpay_app/firebase_options.dart';
import 'package:surpay_app/models/notificationModel.dart';
import 'package:surpay_app/utils/notification_helper.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.notification?.title}");
}

class FcmHelper {
  static FcmHelper? _instance;

  FcmHelper._internal() {
    _instance = this;
  }

  factory FcmHelper() => _instance ?? FcmHelper._internal();

  Future<void> initFcm(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await FirebaseMessaging.instance.requestPermission();
    await FirebaseMessaging.instance.getToken().then((token) {
      print('FCM Token: $token');
    });
    FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.notification?.title}');
      print('Message data: ${message.notification?.body}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
      final NotificationHelper notificationHelper = NotificationHelper();
      NotificationModel restaurant = NotificationModel(
          id: int.tryParse(message.data['id'].toString()) ?? 0,
          title: message.notification?.title,
          body: message.notification?.body,
          payload: 'payload');
      await notificationHelper.showNotification(
          flutterLocalNotificationsPlugin, restaurant);
    });

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }
}
