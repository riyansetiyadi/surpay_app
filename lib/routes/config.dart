import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:surpay_app/screen/home_screen.dart';
import 'package:surpay_app/screen/login_screen.dart';
import 'package:surpay_app/screen/register_screen.dart';
import 'package:surpay_app/screen/webview_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

// GoRouter configuration
final router = GoRouter(
  initialLocation: '/home',
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegistrationScreen(),
    ),
    GoRoute(
      path: '/webview',
      builder: (context, state) {
        final url = state.uri.queryParameters['url'] ?? '';
        return WebviewScreen(url: url);
      },
    ),
  ],
);
