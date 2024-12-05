import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:surpay_app/db/auth_repository.dart';
import 'package:surpay_app/screen/dashboard.dart';
import 'package:surpay_app/screen/contact.dart';
import 'package:surpay_app/screen/hadiah.dart';
import 'package:surpay_app/screen/home_screen.dart';
import 'package:surpay_app/screen/login_screen.dart';
import 'package:surpay_app/screen/penarikan.dart';
import 'package:surpay_app/screen/profile_screen.dart';
import 'package:surpay_app/screen/register_screen.dart';
import 'package:surpay_app/screen/list_survey.dart';
import 'package:surpay_app/screen/detail_survey.dart';
import 'package:surpay_app/screen/tarikdana.dart';
import 'package:surpay_app/screen/webview_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final authRepository = AuthRepository();

List<String> authRoute = [
  '/dashboard',
  '/hadiah',
  '/penarikan',
  '/tarik-dana',
  '/profil',
  '/contact',
  '/survey-aktif'
];

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
      builder: (context, state) {
        final String? phoneNumber = state.uri.queryParameters['phoneNumber'];
        return LoginScreen(
          initPhoneNumber: phoneNumber,
        );
      },
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegistrationScreen(),
    ),
    GoRoute(
      path: '/dashboard',
      builder: (context, state) => const DashboardScreen(),
    ),
    GoRoute(
      path: '/hadiah',
      builder: (context, state) => const HadiahScreen(),
    ),
    GoRoute(
      path: '/penarikan',
      builder: (context, state) => const PenarikanScreen(),
    ),
    GoRoute(
      path: '/profil',
      builder: (context, state) => const ProfileScreen(),
    ),
    GoRoute(
      path: '/contact',
      builder: (context, state) => const ContactScreen(),
    ),
    GoRoute(
      path: '/survey-aktif',
      builder: (context, state) => const ListSurveyScreen(),
    ),
    GoRoute(
      path: '/tarik-dana',
      builder: (context, state) => const TarikDanaScreen(),
    ),
    GoRoute(
      path: '/survey-page',
      builder: (context, state) {
        String? id = state.uri.queryParameters['id'];
        String? surveyTitle = state.uri.queryParameters['title'];
        return DetailSurveyScreen(
          id: id,
          surveyTitle: surveyTitle,
        );
      },
    ),
    GoRoute(
      path: '/webview',
      builder: (context, state) {
        final url = state.uri.queryParameters['url'] ?? '';
        return WebviewScreen(url: url);
      },
    ),
  ],
  redirect: (context, state) async {
    bool isLoggedIn = await authRepository.isLoggedIn();
    if (authRoute.contains(state.fullPath) && !isLoggedIn) {
      return '/login';
    }

    return null;
  },
);
