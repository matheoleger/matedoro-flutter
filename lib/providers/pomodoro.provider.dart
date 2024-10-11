import 'package:flutter/material.dart';
import 'package:matedoro_flutter/providers/timer.provider.dart';

enum CycleType {
  LONG,
  SHORT,
}

class PomodoroProvider extends ChangeNotifier {
  final TimerProvider timerProvider;

  var cyclesNumber = 4;
  var currentCycle = 0;

  // double cycleFocusTime = 25*60; // 25min in seconds
  // double cyclePauseTime = 5*60; // 5min in seconds

  double cycleFocusTime = 5; // 25min in seconds
  double cyclePauseTime = 3; // 5min in seconds

  var isFocus = true;
  var isRunning = false;

  PomodoroProvider({required this.timerProvider}) {
    timerProvider.addListener(_onTimerUpdated);
  }

  @override
  void dispose() {
    // Assurez-vous de retirer le listener lorsque l'objet est détruit
    timerProvider.removeListener(_onTimerUpdated);
    super.dispose();
  }

  void play() {
    timerProvider.startTimer();
    isRunning = true;
  }

  void pause() {
    timerProvider.stopTimer();
    isRunning = false;
  }

  void startNewPomodoroSession(CycleType cycleType) {
    setCycleFocusAndPause(cycleType);

    if(isRunning) {
      timerProvider.stopTimer();
    }
    currentCycle=0;
    timerProvider.setTimerDuration(cycleFocusTime);
    timerProvider.startTimer();
    isFocus = true;
    isRunning = true;
  }

  void setCycleFocusAndPause(CycleType cycleType) {
    if(cycleType == CycleType.LONG) {
      cycleFocusTime = 25*60; // 25min in seconds
      cyclePauseTime = 5*60; // 5min in seconds
    } else {
      cycleFocusTime = 5; 
      cyclePauseTime = 3;
    }
  }

  void _onTimerUpdated() {
    notifyListeners();

    if(timerProvider.timeLeft != 0) return;

    if(isFocus) {
      timerProvider.setTimerDuration(cyclePauseTime);
      isFocus = false;
    } else {
      timerProvider.setTimerDuration(cycleFocusTime);
      isFocus = true;
      currentCycle = (currentCycle + 1)%cyclesNumber;
    }
  }
}