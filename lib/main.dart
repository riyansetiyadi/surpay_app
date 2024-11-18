import 'package:flutter/material.dart';
import 'package:surpay_app/provider/address_provider.dart';
import 'package:surpay_app/provider/auth_provider.dart';
import 'package:surpay_app/routes/config.dart';
import 'package:surpay_app/services/api_address.dart';
import 'package:surpay_app/services/api_surpay.dart';
import 'package:surpay_app/utils/fcm_helper.dart';
import 'package:surpay_app/utils/notification_helper.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';

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
  late AddressProvider addressProvider;
  late AuthProvider authProvider;

  @override
  void initState() {
    super.initState();

    final apiAddressService = ApiAddressService();
    final apiSurpayService = ApiSurpayService();

    addressProvider = AddressProvider(
      apiAddressService,
    );
    authProvider = AuthProvider(
      apiSurpayService,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => addressProvider,
        ),
        ChangeNotifierProvider(
          create: (context) => authProvider,
        ),
      ],
      child: MaterialApp.router(
        routerConfig: router,
      ),
    );
  }
}
