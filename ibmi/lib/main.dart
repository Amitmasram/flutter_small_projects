import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import 'package:ibmi/pages/main_page.dart';
import 'package:ibmi/utils/calculator.dart';

void main() async {
  print(await calculateBMIAsync(Dio()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: const CupertinoThemeData(),
      title: 'IBMI',
      routes: {
        '/': (context) => const MainPage(),
      },
      initialRoute: '/',
    );
  }
}
