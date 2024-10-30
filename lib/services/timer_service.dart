import 'dart:async';

import 'package:flutter/material.dart';

class TimerService extends ChangeNotifier {
  Timer? timer;
  double timeLeft = 0;
  // bool isRunning = false;

  void setTimerDuration(double duration)
  {
    timeLeft = duration;
    notifyListeners();
  }

  void startTimer()
  {
      notifyListeners();
      // isRunning = true;
      Duration periodic = Duration(milliseconds: 1000); // periodic to triggered timer every seconds
      timer = Timer.periodic(periodic, (intervalTime) {
        timeLeft--;
        notifyListeners();
      });
  }

  void stopTimer()
  {
    // isRunning = false;
    timer?.cancel();
    notifyListeners();
  }
}