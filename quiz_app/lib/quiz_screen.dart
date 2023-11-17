import 'package:flutter/material.dart';
import 'quiz_data_provider.dart';
import 'quiz_data.dart';
import 'result_screen.dart';  // Import the ResultScreen file
import 'score.dart';        // Import the Score file
import 'timer.dart';        // Import the Timer file

class QuizScreen extends StatefulWidget {
  final Score score;

  QuizScreen({required this.score});

  @override
  _QuizScreenState createState() => _QuizScreenState(score: score);
}

class _QuizScreenState extends State<QuizScreen> {
  final Score score;
  late QuizTimer quizTimer;

  _QuizScreenState({required this.score}) {
    quizTimer = QuizTimer(_updateTimer);
    quizTimer.start();
  }

  void _updateTimer() {
    setState(() {
      // Force a rebuild to update the timer display
    });
  }

  List<QuizQuestion> _questions = QuizDataProvider.getQuestions();
  int _currentQuestionIndex = 0;
 bool _answerSelected = false; // Track whether an answer has been selected

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
      ),
      body: _buildQuizBody(),
    );
  }

  Widget _buildQuizBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(_questions[_currentQuestionIndex].question),
        SizedBox(height: 20),
        _buildOptions(),
        SizedBox(height: 20),
        Text('Time remaining: ${quizTimer.seconds} seconds'),
      ],
    );
  }

// Inside _QuizScreenState class

Widget _buildOptions() {
  return Column(
    children: _questions[_currentQuestionIndex].options.map((option) {
      return ElevatedButton(
        onPressed: _answerSelected ? null : () => _checkAnswer(option),
        child: Text(option),
      );
    }).toList(),
  );
}

  void _checkAnswer(String selectedOption) {
    quizTimer.reset(); // Reset the timer for the next question

    setState(() {
      _answerSelected = true; // Set to true when an answer is selected
    });

    Future.delayed(Duration(seconds: 2), () {
      if (selectedOption ==
          _questions[_currentQuestionIndex].options[_questions[_currentQuestionIndex].correctOptionIndex]) {
        // Correct answer
        _handleCorrectAnswer();
      } else {
        // Incorrect answer
        _handleIncorrectAnswer();
      }

      setState(() {
        _answerSelected = false; // Reset after feedback is displayed
      });
    });
  }

  void _handleCorrectAnswer() {
    // Add your logic for correct answer feedback
    print('Correct answer');
    _moveToNextQuestion();
  }

  void _handleIncorrectAnswer() {
    // Add your logic for incorrect answer feedback
    print('Incorrect answer');
    _moveToNextQuestion();
  }

  void _moveToNextQuestion() {
    setState(() {
      if (_currentQuestionIndex < _questions.length - 1) {
        _currentQuestionIndex++;
      } else {
        // Quiz completed
        // Navigate to the result screen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultScreen(score: score.value, totalQuestions: _questions.length),
          ),
        );
      }
    });
  }
}