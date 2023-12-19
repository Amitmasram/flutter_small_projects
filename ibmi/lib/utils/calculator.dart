import 'dart:math';

import 'package:dio/dio.dart';

double calculateBMI(int height, int weight) {
  return 703 * (weight / pow(height, 2));
}

// Future<double> calculateBMIAsync(Dio _dio) async {
//   var _result = await _dio.get('https://www.jsonkeeper.com/b/XQ7O');
//   var _data = _result.data;
//   var _bmi = calculateBMI(_data["Sergio Ramos"][0], _data["Sergio Ramos"][1]);

//   return _bmi;
// }
Future<double> calculateBMIAsync(Dio _dio) async {
  try {
    var _result = await _dio.get('https://www.jsonkeeper.com/b/XQ7O');

    if (_result.data != null && _result.data["Sergio Ramos"] != null) {
      var _data = _result.data;
      var _bmi =
          calculateBMI(_data["Sergio Ramos"][0], _data["Sergio Ramos"][1]);
      return _bmi;
    } else {
      // Handle the case when data or "Sergio Ramos" is null
      // Example: return a default value or throw an error
      return 0.0; // Change this to an appropriate default value
    }
  } catch (e) {
    // Handle Dio request error
    print('Error: $e');
    return 0.0; // Change this to an appropriate default value or error handling
  }
}
