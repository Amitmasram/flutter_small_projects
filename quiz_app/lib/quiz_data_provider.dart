// quiz_data_provider.dart
import 'quiz_data.dart';

class QuizDataProvider {
  static List<QuizQuestion> getQuestions() {
    return [
      QuizQuestion(
        question: 'What is the capital of Japan?',
        options: ['Seoul', 'Beijing', 'Tokyo', 'Bangkok'],
        correctOptionIndex: 2,
      ),
      QuizQuestion(
        question: 'Which planet is known as the Red Planet?',
        options: ['Venus', 'Mars', 'Jupiter', 'Saturn'],
        correctOptionIndex: 1,
      ),
      QuizQuestion(
        question: 'Who wrote "Romeo and Juliet"?',
        options: ['Charles Dickens', 'William Shakespeare', 'Jane Austen', 'Mark Twain'],
        correctOptionIndex: 1,
      ),
      // Add more questions...
    ];
  }
}
