import 'package:application/presentation/pages/main/main_page.dart';
import 'package:application/presentation/pages/splash/splash_page.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:feature_auth/di/auth_module.dart';
import 'package:feature_auth/presentation/blocs/auth/auth_bloc.dart';
import 'package:feature_auth/presentation/pages/sign_in_page.dart';
import 'package:feature_auth/presentation/pages/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared/shared.dart';

class MockAuthBloc extends Mock implements AuthBloc {}

void main() {
  late MockAuthBloc mockAuthBloc;

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();

    await AuthModule.init();
    mockAuthBloc = MockAuthBloc();
    await sl.unregister<AuthBloc>();
    sl.registerSingleton<AuthBloc>(mockAuthBloc);

    // ✅ SET default state
    when(() => mockAuthBloc.state).thenReturn(AuthAuthenticatedState());

    // ✅ Optional: if your MainPage listens to Bloc stream
    whenListen(
      mockAuthBloc,
      Stream<AuthState>.fromIterable([AuthAuthenticatedState()]),
      initialState: AuthAuthenticatedState(),
    );
  });

  tearDownAll(() async {
    await sl.reset(dispose: true);
  });

  group('MainPage', () {
    testWidgets('SplashPage shows splash image', (tester) async {
      final testRouter = AppNavigation.router(
        initialLocation: '/splash',
        observers: [
          SentryService.navigatorObserver,
          ChuckerFlutterUtils.navigatorObserver,
        ],
        pages: [
          AppPage(
            path: '/',
            name: 'main',
            builder: (context, state) => const MainPage(),
          ),
          AppPage(
            path: '/sign-in',
            name: 'signIn',
            builder: (context, state) => const SignInPage(),
          ),
          AppPage(
            path: '/splash',
            name: 'splash',
            builder: (context, state) => const SplashPage(),
          ),
          AppPage(
            path: '/sign-up',
            name: 'signUp',
            builder: (context, state) => const SignUpPage(),
          ),
        ],
        errorBuilder: (context, state) => const MainPage(),
      );

      await tester.pumpWidget(
        MaterialApp.router(
          routerConfig: testRouter,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
        ),
      );

      // Simulasi delay 1.5 detik dari Future.delayed()
      await tester.pump(const Duration(milliseconds: 1500));

      await tester.pump(); // Render widget

      expect(find.byKey(const Key('SplashImage')), findsOneWidget);
    });
  });
}
