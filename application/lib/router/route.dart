import 'package:application/presentation/pages/main/main_auth_page.dart';
import 'package:application/presentation/pages/splash/splash_page.dart';
import 'package:core/core.dart';

import 'package:application/presentation/pages/main/main_page.dart';
import 'package:application/presentation/pages/splash/splash_auth_page.dart';
import 'package:feature_auth/presentation/pages/sign_in_page.dart';
import 'package:feature_auth/presentation/pages/sign_up_page.dart';

/// =========================================================
/// Created by Pahnal Aditia
/// GitHub  : https://github.com/fahnaladitia
/// LinkedIn: https://www.linkedin.com/in/pahnaladitia
/// =========================================================

class AppRoute {
  AppRoute._();

  /// Create and expose your router instance
  static final router = AppNavigation.router(
    initialLocation: '/splash',
    observers: [
      SentryService.navigatorObserver,
      ChuckerFlutterUtils.navigatorObserver,
    ],
    pages: [
      AppPage(
        path: "/",
        transitionType: AppPageTranstionType.none,
        builder: (context, state) => MainPage(),
      ),
      AppPage(path: "/splash", builder: (_, _) => const SplashPage()),
    ],
    errorBuilder: (context, state) => const MainPage(),
  );

  static final routerWithAuth = AppNavigation.router(
    initialLocation: '/splash',
    observers: [
      SentryService.navigatorObserver,
      ChuckerFlutterUtils.navigatorObserver,
    ],
    pages: [
      AppPage(path: '/', builder: (context, state) => MainAuthPage()),
      AppPage(path: '/splash', builder: (_, __) => const SplashAuthPage()),
      AppPage(
        path: '/sign-in',
        transitionType: AppPageTranstionType.none,
        builder: (_, __) => SignInPage(),
      ),
      AppPage(path: '/sign-up', builder: (_, __) => const SignUpPage()),
    ],
    errorBuilder: (context, state) => const MainAuthPage(),
  );
}
