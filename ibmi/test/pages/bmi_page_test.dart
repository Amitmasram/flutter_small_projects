import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ibmi/pages/bmi_page.dart';

void main() {
  testWidgets('Given user on BMI page Click on weight in minus by 1',
      (tester) async {
    // Arrange
    await tester.pumpWidget(const CupertinoApp(
      home: BMIPage(),
    ));
    var _weightIncrementButton = find.byKey(const Key('weight_minus'));
    // Act
    await tester.tap(_weightIncrementButton);
    await tester.pump();

    // Assert
    var _text = find.text('159');
    expect(_text, findsOneWidget);
  });
}
