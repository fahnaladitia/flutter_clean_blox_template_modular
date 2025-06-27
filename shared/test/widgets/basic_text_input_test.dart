import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared/shared.dart'; // Ganti sesuai dengan path modul kamu

void main() {
  group('BasicTextInput', () {
    testWidgets('renders with label and hintText', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BasicTextInput(
              labelText: 'Email',
              hintText: 'Enter your email',
            ),
          ),
        ),
      );

      expect(find.text('Email'), findsOneWidget);
      expect(find.byType(TextFormField), findsOneWidget);
      expect(find.text('Enter your email'), findsOneWidget);
    });

    testWidgets('can type text into the input', (tester) async {
      final controller = TextEditingController();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BasicTextInput(controller: controller, labelText: 'Username'),
          ),
        ),
      );

      await tester.enterText(find.byType(TextFormField), 'fahnaladitia');
      expect(controller.text, 'fahnaladitia');
    });

    testWidgets('toggles obscureText visibility when suffix icon tapped', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BasicTextInput(
              labelText: 'Password',
              hintText: 'Enter password',
              obscureText: true,
            ),
          ),
        ),
      );

      // Awalnya harus visibility icon (password hidden)
      expect(find.byIcon(Icons.visibility), findsOneWidget);
      expect(find.byIcon(Icons.visibility_off), findsNothing);

      // Tap icon visibility untuk toggle
      await tester.tap(find.byIcon(Icons.visibility));
      await tester.pump();

      // Harus berubah jadi visibility_off (password visible)
      expect(find.byIcon(Icons.visibility_off), findsOneWidget);
      expect(find.byIcon(Icons.visibility), findsNothing);
    });
  });
}
