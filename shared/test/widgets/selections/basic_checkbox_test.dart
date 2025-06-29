import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared/shared.dart';

void main() {
  group('BasicCheckbox - Android', () {
    testWidgets('toggles when active', (tester) async {
      bool toggled = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BasicCheckbox.android(
              initialValue: false,
              onChanged: (v) => toggled = v,
              label: 'Android',
            ),
          ),
        ),
      );

      await tester.tap(find.byType(Checkbox));
      await tester.pumpAndSettle();
      expect(toggled, isTrue);
    });

    testWidgets('does not toggle when disabled', (tester) async {
      bool called = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BasicCheckbox.android(
              initialValue: false,
              state: BasicSelectionState.disabled,
              onChanged: (_) => called = true,
              label: 'Disabled Android',
            ),
          ),
        ),
      );

      await tester.tap(find.byType(Checkbox));
      await tester.pump();
      expect(called, isFalse);
    });
  });

  group('BasicCheckbox - iOS', () {
    testWidgets('toggles when active', (tester) async {
      bool value = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BasicCheckbox.ios(
              initialValue: false,
              onChanged: (v) => value = v,
              label: 'iOS',
            ),
          ),
        ),
      );

      await tester.tap(find.byType(CupertinoCheckbox));
      await tester.pumpAndSettle();
      expect(value, isTrue);
    });

    testWidgets('does not toggle when disabled', (tester) async {
      bool called = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BasicCheckbox.ios(
              initialValue: false,
              state: BasicSelectionState.disabled,
              onChanged: (_) => called = true,
              label: 'Disabled iOS',
            ),
          ),
        ),
      );

      await tester.tap(find.byType(CupertinoCheckbox));
      await tester.pump();
      expect(called, isFalse);
    });
  });

  group('BasicCheckbox - Adaptive', () {
    testWidgets('toggles when active', (tester) async {
      bool updated = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BasicCheckbox.adaptive(
              initialValue: false,
              onChanged: (v) => updated = v,
              label: 'Adaptive',
            ),
          ),
        ),
      );

      await tester.tap(find.byType(Checkbox));
      await tester.pump();
      expect(updated, isTrue);
    });

    testWidgets('does not toggle when disabled', (tester) async {
      bool called = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BasicCheckbox.adaptive(
              initialValue: false,
              state: BasicSelectionState.disabled,
              onChanged: (_) => called = true,
              label: 'Disabled Adaptive',
            ),
          ),
        ),
      );

      await tester.tap(find.byType(Checkbox));
      await tester.pump();
      expect(called, isFalse);
    });
  });

  group('BasicCheckbox - Customizations', () {
    testWidgets('shows label and applies custom colors', (tester) async {
      const labelText = 'Custom Checkbox';
      const checkColor = Colors.pink;
      const backgroundColor = Colors.black;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BasicCheckbox.android(
              initialValue: true,
              label: labelText,
              checkColor: checkColor,
              backgroundColor: backgroundColor,
              onChanged: (_) {},
            ),
          ),
        ),
      );

      expect(find.text(labelText), findsOneWidget);

      final checkbox = tester.widget<Checkbox>(find.byType(Checkbox));
      expect(checkbox.checkColor, equals(checkColor));
      expect(checkbox.activeColor, equals(backgroundColor));
    });
  });
}
