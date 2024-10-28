import 'package:flutter/material.dart';
import 'package:surpay_app/routes/config.dart';
import 'package:surpay_app/utils/fcm_helper.dart';
import 'package:surpay_app/utils/notification_helper.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final NotificationHelper notificationHelper = NotificationHelper();
  final FcmHelper fcmHelper = FcmHelper();

  await notificationHelper.initNotifications(flutterLocalNotificationsPlugin);

  await fcmHelper.initFcm(flutterLocalNotificationsPlugin);

  runApp(const SurpayApp());
}

class SurpayApp extends StatefulWidget {
  const SurpayApp({super.key});

  @override
  State<SurpayApp> createState() => _SurpayAppState();
}

class _SurpayAppState extends State<SurpayApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}
