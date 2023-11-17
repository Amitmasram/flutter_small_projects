import 'package:flutter/material.dart';

import 'quizapp/main_screen.dart'; // Import your main screen file

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      home: MainScreen(),
    );
  }
}
