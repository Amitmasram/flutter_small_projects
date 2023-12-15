import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class GamePageProvider extends ChangeNotifier {
  final Dio _dio = Dio();
  final int _maxQustions = 10;
  List? questions;
  final String difficultyLevel;
  int _currentQuestionCount = 0;
  int _correctCount = 0;

  BuildContext context;
  GamePageProvider({required this.context, required this.difficultyLevel}) {
    _dio.options.baseUrl =
        "https://opentdb.com/api.php?amount=10&difficulty=easy";
    _getQuestionsFromAPI();
    print("Hello");
  }
  Future<void> _getQuestionsFromAPI() async {
    print(difficultyLevel);
    var _response = await _dio.get('amount', queryParameters: {
      'amount': 10,
      'type': 'boolean',
      'difficulty': difficultyLevel,
    });
    var _data = jsonDecode(_response.toString());
    print(_data);
    questions = _data["results"];
    notifyListeners();
  }

  String getCurrentQuestionText() {
    return questions![_currentQuestionCount]['question'];
  }

  void answerQuestion(String _answer) async {
    bool isCorrect =
        questions![_currentQuestionCount]["correct_answer"] == _answer;
    _correctCount += isCorrect ? 1 : 0;
    _currentQuestionCount++;
    showDialog(
        context: context,
        builder: (BuildContext _context) {
          return AlertDialog(
            backgroundColor: isCorrect ? Colors.green : Colors.red,
            title: Icon(
              isCorrect ? Icons.check_circle : Icons.cancel_sharp,
              color: Colors.white,
            ),
          );
        });
    await Future.delayed(Duration(seconds: 1));
    Navigator.pop(context);
    if (_currentQuestionCount == _maxQustions) {
      endGame();
    } else {
      notifyListeners();
    }
    //print(isCorrect ? "Correct!" : "InCorrect");
  }

  Future<void> endGame() async {
    showDialog(
        context: context,
        builder: (BuildContext _context) {
          return AlertDialog(
            backgroundColor: Colors.blue,
            title: Text(
              "End Game!",
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
            content: Text("Score :$_correctCount/$_maxQustions"),
          );
        });
    await Future.delayed(Duration(seconds: 3));
    Navigator.pop(context);
    Navigator.pop(context);
  }
}
