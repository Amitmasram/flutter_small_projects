import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ibmi/utils/calculator.dart';
import 'package:mocktail/mocktail.dart';

class DioMock extends Mock implements Dio {}

void main() {
  testWidgets('calculator ...', (tester) async {
    // Arrange
    const int height = 70, weight = 160;

    // Act
    double bmi = calculateBMI(height, weight);

    // Assert
    expect(bmi, 22.955102040816328);
  });

  test('Given Url Testing', () async {
    // Arrange
    final _diomock = DioMock();
    when(() => _diomock.get('https://www.jsonkeeper.com/b/XQ7O')).thenAnswer(
        (_) => Future.value(Response(
                requestOptions: RequestOptions(
                    path: 'https://www.jsonkeeper.com/b/XQ7O',
                    data: {
                  "Sergio Ramos": [72, 165]
                }))));

    // Act
    var _result = await calculateBMIAsync(_diomock); // Await the result

    // Assert
    expect(_result, 0.0);
  });
}
