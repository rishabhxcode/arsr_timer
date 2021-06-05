import 'package:bloc/bloc.dart';
import 'dart:async';


class TimerCubit extends Cubit<List<int>> {
  TimerCubit() : super([0, 0, 0, 0]);
  Timer timer;

  bool _isTimeEnds(int endHour, int endMinute, int hours, int minutes) {
    var currentTime = DateTime.now();
    if (hours == currentTime.hour - endHour &&
        minutes == currentTime.minute - endMinute) {
      return true;
    }
    return false;
  }

  void startTimer(int endHour, int endMinute) {
    int seconds = 0;
    int hours = 0;
    int milliseconds = 0;
    int minutes = 0;
    if (!_isTimeEnds(endHour, endMinute, hours, minutes)) {
      timer = Timer.periodic(Duration(milliseconds: 1), (timer) {
        milliseconds += 1;
        if (milliseconds == 1000) {
          milliseconds = 0;
          seconds++;
        }
        if (seconds == 60) {
          seconds = 0;
          minutes++;
        }
        if (minutes == 60) {
          minutes = 0;
          hours++;
        }
        emit([hours, minutes, seconds, milliseconds]);
      });
    } else {
      timer.cancel();
    }
  }

  void resetTimer() {
    timer.cancel();
    timer = null;
    emit([0, 0, 0, 0]);
  }
}
