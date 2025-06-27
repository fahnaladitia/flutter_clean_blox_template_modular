import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared/shared.dart';

void main() {
  setUp(() {
    GoogleFonts.config.allowRuntimeFetching = false;
  });
  group('AppTextStyle Unit Tests', () {
    test('labelInputText should return correct TextStyle', () {
      final style = AppTextStyle.labelInputText;
      expect(style.fontSize, 13);
      expect(style.fontWeight, FontWeight.w400);
      expect(style.color, const Color(0xFFB9B9B9));
    });

    test('hintInputText should return correct TextStyle', () {
      final style = AppTextStyle.hintInputText;
      expect(style.fontSize, 15);
      expect(style.fontWeight, FontWeight.w400);
      expect(style.color, const Color(0xFFB9B9B9));
    });

    test('text should return correct TextStyle', () {
      final style = AppTextStyle.text;
      expect(style.fontSize, 15);
      expect(style.fontWeight, FontWeight.w400);
      expect(style.color, const Color(0xFF757575));
    });

    test('textBold should return bold TextStyle', () {
      final style = AppTextStyle.textBold;
      expect(style.fontSize, 16);
      expect(style.fontWeight, FontWeight.w700);
      expect(style.color, const Color(0xFF757575));
    });

    test('display should return correct display style', () {
      final style = AppTextStyle.display;
      expect(style.fontSize, 21);
      expect(style.fontWeight, FontWeight.w400);
      expect(style.color, const Color(0xFF121212));
    });

    test('displayBold should return correct displayBold style', () {
      final style = AppTextStyle.displayBold;
      expect(style.fontSize, 21);
      expect(style.fontWeight, FontWeight.w600);
      expect(style.color, const Color(0xFF121212));
    });

    test('buttonText should be white and bold', () {
      final style = AppTextStyle.buttonText;
      expect(style.fontSize, 15);
      expect(style.fontWeight, FontWeight.w600);
      expect(style.color, Colors.white);
    });

    test('buttonTextBold should be white and bold', () {
      final style = AppTextStyle.buttonTextBold;
      expect(style.fontSize, 15);
      expect(style.fontWeight, FontWeight.w600);
      expect(style.color, Colors.white);
    });

    test('appBarTitle should return correct style', () {
      final style = AppTextStyle.appBarTitle;
      expect(style.fontSize, 17);
      expect(style.fontWeight, FontWeight.w500);
      expect(style.color, const Color(0xFF121212));
    });
  });

  group('AppTextStyle Widget Tests', () {
    testWidgets('Text widget uses AppTextStyle.textBold', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Text('Styled Text', style: AppTextStyle.textBold),
          ),
        ),
      );

      final textFinder = find.text('Styled Text');
      expect(textFinder, findsOneWidget);

      final Text textWidget = tester.widget(textFinder);
      expect(textWidget.style?.fontWeight, FontWeight.w700);
      expect(textWidget.style?.color, const Color(0xFF757575));
    });

    testWidgets('Text widget uses AppTextStyle.displayBold', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Text('Display Text', style: AppTextStyle.displayBold),
          ),
        ),
      );

      final textFinder = find.text('Display Text');
      expect(textFinder, findsOneWidget);

      final Text textWidget = tester.widget(textFinder);
      expect(textWidget.style?.fontWeight, FontWeight.w600);
      expect(textWidget.style?.fontSize, 21);
    });
  });
}
