import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared/shared.dart'; // Ganti sesuai path aslimu

void main() {
  group('BasicSwitch', () {
    testWidgets('renders Android switch and toggles', (tester) async {
      bool value = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BasicSwitch.android(
              initialValue: value,
              label: 'Android',
              onChanged: (v) => value = v,
            ),
          ),
        ),
      );

      expect(find.text('Android'), findsOneWidget);
      expect(find.byType(Switch), findsOneWidget);

      await tester.tap(find.byType(Switch));
      await tester.pumpAndSettle();

      expect(value, isTrue);
    });

    testWidgets('renders iOS switch and toggles', (tester) async {
      bool value = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BasicSwitch.ios(
              initialValue: value,
              label: 'iOS',
              onChanged: (v) => value = v,
            ),
          ),
        ),
      );

      expect(find.text('iOS'), findsOneWidget);
      expect(find.byType(CupertinoSwitch), findsOneWidget);

      await tester.tap(find.byType(CupertinoSwitch));
      await tester.pumpAndSettle();

      expect(value, isTrue);
    });

    testWidgets('renders Native switch and toggles', (tester) async {
      bool value = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BasicSwitch.native(
              initialValue: value,
              label: 'Native',
              onChanged: (v) => value = v,
            ),
          ),
        ),
      );

      expect(find.text('Native'), findsOneWidget);
      expect(
        find.byType(Switch),
        findsOneWidget,
      ); // Adaptive resolves to Switch

      await tester.tap(find.byType(Switch));
      await tester.pumpAndSettle();

      expect(value, isTrue);
    });

    testWidgets('renders Icon switch and toggles icon', (tester) async {
      bool value = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BasicSwitch.icon(
              initialValue: value,
              label: 'IconSwitch',
              activeIcon: const Icon(Icons.check),
              inactiveIcon: const Icon(Icons.close),
              onChanged: (v) => value = v,
            ),
          ),
        ),
      );

      expect(find.text('IconSwitch'), findsOneWidget);
      expect(find.byIcon(Icons.close), findsOneWidget);

      await tester.tap(find.byType(IconButton));
      await tester.pumpAndSettle();

      expect(value, isTrue);
      expect(find.byIcon(Icons.check), findsOneWidget);
    });

    testWidgets('disabled switch does not toggle', (tester) async {
      bool value = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BasicSwitch.android(
              initialValue: value,
              state: BasicSwitchState.disabled,
              label: 'Disabled',
              onChanged: (v) => value = v,
            ),
          ),
        ),
      );

      expect(find.byType(Switch), findsOneWidget);

      await tester.tap(find.byType(Switch));
      await tester.pumpAndSettle();

      expect(value, isFalse); // should remain unchanged
    });
  });
}
