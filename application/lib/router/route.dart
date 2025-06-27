import 'dart:io';

import 'package:core/core.dart';
import 'package:feature_auth/presentation/pages/sign_in_page.dart';
import 'package:feature_auth/presentation/pages/sign_up_page.dart';

import 'package:application/presentation/pages/main/main_page.dart';
import 'package:application/presentation/pages/splash/splash_page.dart';

/// =========================================================
/// Created by Pahnal Aditia
/// GitHub  : https://github.com/fahnaladitia
/// LinkedIn: https://www.linkedin.com/in/pahnaladitia
/// =========================================================

class AppRoute {
  AppRoute._();

  /// Define your route paths
  static const String mainPath = '/main';
  static const String signInPath = '/sign-in';
  static const String signUpPath = '/sign-up';
  static const String splashPath = '/splash';

  /// Define your route names
  static const String main = 'main';
  static const String signIn = 'sign-in';
  static const String signUp = 'sign-up';
  static const String splash = 'splash';

  /// Create and expose your router instance
  static final router = AppNavigation.router(
    initialLocation: Platform.isAndroid ? splashPath : mainPath,
    observers: [
      SentryService.navigatorObserver,
      ChuckerFlutterUtils.navigatorObserver,
    ],
    pages: [
      AppPage(
        path: mainPath,
        name: main,
        builder: (context, state) => const MainPage(),
      ),
      AppPage(
        path: signInPath,
        name: signIn,
        builder: (context, state) => const SignInPage(),
      ),
      AppPage(
        path: splashPath,
        name: splash,
        builder: (context, state) => const SplashPage(),
      ),
      AppPage(
        path: signUpPath,
        name: signUp,
        builder: (context, state) => const SignUpPage(),
      ),
    ],
    errorBuilder: (context, state) => const MainPage(),
  );
}
