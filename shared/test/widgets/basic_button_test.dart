// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:shared/shared.dart'; // Ganti sesuai path ke BasicButton

// void main() {
//   group('BasicButton.primary', () {
//     testWidgets('should display text and trigger onPressed when active', (
//       WidgetTester tester,
//     ) async {
//       bool tapped = false;

//       await tester.pumpWidget(
//         MaterialApp(
//           home: Scaffold(
//             body: BasicButton.primary(
//               text: 'Primary',
//               onPressed: () => tapped = true,
//             ),
//           ),
//         ),
//       );

//       expect(find.text('Primary'), findsOneWidget);
//       await tester.tap(find.byType(FilledButton));
//       expect(tapped, isTrue);
//     });

//     testWidgets('should show loading spinner when state is loading', (
//       WidgetTester tester,
//     ) async {
//       await tester.pumpWidget(
//         MaterialApp(
//           home: Scaffold(
//             body: BasicButton.primary(
//               text: 'Loading',
//               state: BasicButtonEventState.loading,
//               onPressed: () {},
//             ),
//           ),
//         ),
//       );

//       expect(find.byType(CircularProgressIndicator), findsOneWidget);
//       expect(find.text('Loading'), findsNothing);
//     });

//     testWidgets('should not trigger onPressed when disabled', (
//       WidgetTester tester,
//     ) async {
//       bool tapped = false;

//       await tester.pumpWidget(
//         MaterialApp(
//           home: Scaffold(
//             body: BasicButton.primary(
//               text: 'Disabled',
//               state: BasicButtonEventState.disabled,
//               onPressed: () => tapped = true,
//             ),
//           ),
//         ),
//       );

//       await tester.tap(find.byType(FilledButton));
//       expect(tapped, isFalse);
//     });

//     testWidgets('should display icon if provided', (WidgetTester tester) async {
//       await tester.pumpWidget(
//         MaterialApp(
//           home: Scaffold(
//             body: BasicButton.primary(
//               text: 'With Icon',
//               icon: const Icon(Icons.add),
//               onPressed: () {},
//             ),
//           ),
//         ),
//       );

//       expect(find.text('With Icon'), findsOneWidget);
//       expect(find.byIcon(Icons.add), findsOneWidget);
//     });
//   });

//   group('BasicButton.secondary', () {
//     testWidgets('should display text and trigger onPressed', (tester) async {
//       bool tapped = false;

//       await tester.pumpWidget(
//         MaterialApp(
//           home: Scaffold(
//             body: BasicButton.secondary(
//               text: 'Secondary',
//               onPressed: () => tapped = true,
//             ),
//           ),
//         ),
//       );

//       expect(find.text('Secondary'), findsOneWidget);
//       await tester.tap(find.byType(FilledButton));
//       expect(tapped, isTrue);
//     });

//     testWidgets('should render with border color', (tester) async {
//       await tester.pumpWidget(
//         MaterialApp(
//           home: Scaffold(
//             body: BasicButton.secondary(text: 'Check Border', onPressed: () {}),
//           ),
//         ),
//       );

//       final filledButton = tester.widget<FilledButton>(
//         find.byType(FilledButton),
//       );
//       final buttonStyle = filledButton.style!;
//       final shape = buttonStyle.shape!.resolve({}) as RoundedRectangleBorder;

//       expect(shape.side.color, equals(const Color(0xFF1FA0C9))); // border color
//     });
//   });
// }
