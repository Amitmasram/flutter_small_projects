// timer.dart
import 'dart:async';

class QuizTimer {
  late Timer _timer;
  int seconds = 15;
  final Function onTimerUpdate;

  QuizTimer(this.onTimerUpdate);

  void start() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (seconds > 0) {
        seconds--;
        onTimerUpdate();
      } else {
        // Time's up, handle accordingly (e.g., move to the next question)
        timer.cancel();
      }
    });
  }

  void reset() {
    _timer.cancel();
    seconds = 15; // Reset the timer duration
    onTimerUpdate();
    start();
  }

  void cancel() {
    _timer.cancel();
  }
}
