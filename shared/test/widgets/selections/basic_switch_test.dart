import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared/shared.dart';

void main() {
  group('BasicSwitch Tests', () {
    testWidgets('Android Active', (tester) async {
      bool changed = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BasicSwitch.android(
              initialValue: false,
              state: BasicSwitchState.active,
              label: 'Android',
              onChanged: (val) => changed = val,
            ),
          ),
        ),
      );
      await tester.tap(find.byType(Switch));
      await tester.pump();
      expect(changed, isTrue);
    });

    testWidgets('Android Disabled', (tester) async {
      bool called = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BasicSwitch.android(
              initialValue: false,
              state: BasicSwitchState.disabled,
              label: 'Android Disabled',
              onChanged: (_) => called = true,
            ),
          ),
        ),
      );
      await tester.tap(find.byType(Switch));
      await tester.pump();
      expect(called, isFalse);
    });

    testWidgets('iOS Active', (tester) async {
      bool triggered = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BasicSwitch.ios(
              initialValue: false,
              state: BasicSwitchState.active,
              onChanged: (val) => triggered = val,
            ),
          ),
        ),
      );
      await tester.tap(find.byType(CupertinoSwitch));
      await tester.pump();
      expect(triggered, isTrue);
    });

    testWidgets('iOS Disabled', (tester) async {
      bool changed = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BasicSwitch.ios(
              initialValue: false,
              state: BasicSwitchState.disabled,
              onChanged: (_) => changed = true,
            ),
          ),
        ),
      );
      await tester.tap(find.byType(CupertinoSwitch));
      await tester.pump();
      expect(changed, isFalse);
    });

    testWidgets('Adaptive Active', (tester) async {
      bool triggered = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BasicSwitch.adaptive(
              initialValue: false,
              state: BasicSwitchState.active,
              onChanged: (val) => triggered = val,
            ),
          ),
        ),
      );
      await tester.tap(find.byType(Switch));
      await tester.pump();
      expect(triggered, isTrue);
    });

    testWidgets('Adaptive Disabled', (tester) async {
      bool triggered = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BasicSwitch.adaptive(
              initialValue: false,
              state: BasicSwitchState.disabled,
              onChanged: (_) => triggered = true,
            ),
          ),
        ),
      );
      await tester.tap(find.byType(Switch));
      await tester.pump();
      expect(triggered, isFalse);
    });

    testWidgets('Icon Type: active icon displayed when true', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BasicSwitch.icon(
              initialValue: true,
              activeIcon: const Icon(Icons.check),
              inactiveIcon: const Icon(Icons.close),
            ),
          ),
        ),
      );
      expect(find.byIcon(Icons.check), findsOneWidget);
      expect(find.byIcon(Icons.close), findsNothing);
    });

    testWidgets('Icon Type: inactive icon displayed when false', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BasicSwitch.icon(
              initialValue: false,
              activeIcon: const Icon(Icons.check),
              inactiveIcon: const Icon(Icons.close),
            ),
          ),
        ),
      );
      expect(find.byIcon(Icons.close), findsOneWidget);
      expect(find.byIcon(Icons.check), findsNothing);
    });

    testWidgets('Icon Type: toggles value when active', (tester) async {
      bool value = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BasicSwitch.icon(
              initialValue: false,
              activeIcon: const Icon(Icons.check),
              inactiveIcon: const Icon(Icons.close),
              onChanged: (val) => value = val,
            ),
          ),
        ),
      );
      await tester.tap(find.byType(IconButton));
      await tester.pump();
      expect(value, isTrue);
    });

    testWidgets('Icon Type: does not toggle when disabled', (tester) async {
      bool value = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BasicSwitch.icon(
              initialValue: false,
              state: BasicSwitchState.disabled,
              activeIcon: const Icon(Icons.check),
              inactiveIcon: const Icon(Icons.close),
              onChanged: (_) => value = true,
            ),
          ),
        ),
      );
      await tester.tap(find.byType(IconButton));
      await tester.pump();
      expect(value, isFalse);
    });

    testWidgets('Icon Type: custom icon colors and backgrounds', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BasicSwitch.icon(
              initialValue: true,
              activeIcon: const Icon(Icons.check),
              inactiveIcon: const Icon(Icons.close),
              activeColor: Colors.red,
              inactiveColor: Colors.blue,
              activeBackgroundColor: Colors.green,
              inactiveBackgroundColor: Colors.yellow,
            ),
          ),
        ),
      );

      final iconButton = tester.widget<IconButton>(find.byType(IconButton));
      expect(iconButton.color, Colors.red);
    });
  });
}
