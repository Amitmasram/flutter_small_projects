// main_screen.dart
import 'package:flutter/material.dart';
import 'quiz_screen.dart'; // Import the quiz screen file
import 'score.dart';

class MainScreen extends StatelessWidget {
  final Score score = Score();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to the Quiz App!',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to the quiz screen when the button is pressed
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuizScreen(score: score),
                  ),
                );
              },
              child: Text('Start Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
