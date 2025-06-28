import 'package:application/router/route.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:feature_auth/di/auth_module.dart';
import 'package:feature_auth/presentation/blocs/auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared/l10n/app_localizations.dart';

class MockAuthBloc extends Mock implements AuthBloc {}

void main() {
  late MockAuthBloc mockAuthBloc;

  setUpAll(() async {
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
      final testRouter = AppRoute.router;

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

      expect(find.byType(Image), findsOneWidget);
      expect(find.byKey(const Key('SplashScaffold')), findsOneWidget);
    });
  });
}
