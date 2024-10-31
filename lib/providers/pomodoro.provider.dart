import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:matedoro_flutter/models/cycle.dart';
import 'package:matedoro_flutter/models/history_item.dart';
import 'package:matedoro_flutter/models/session.dart';
import 'package:matedoro_flutter/services/timer_service.dart';
import 'package:matedoro_flutter/services/database_service.dart';

enum CycleType {
  LONG,
  SHORT,
  DEBUG
}

class PomodoroProvider extends ChangeNotifier {
  final TimerService timerService;
  final DatabaseService databaseService;

  Session? currentSession;
  Cycle? currentCycle;

  var cyclesNumber = 4;
  var currentCycleNumber = 0;

  double cycleFocusTime = 25*60; // 25min in seconds
  double cyclePauseTime = 5*60; // 5min in seconds

  var isFocus = true;
  var isRunning = false;
  var isStopped = true;

  PomodoroProvider({required this.timerService, required this.databaseService}) {
    timerService.addListener(_onTimerUpdated);
  }

  @override
  void dispose() {
    // Assurez-vous de retirer le listener lorsque l'objet est détruit
    timerService.removeListener(_onTimerUpdated);
    super.dispose();
  }

  void play() {
    timerService.startTimer();
    isRunning = true;
  }

  void pause() {
    timerService.stopTimer();
    isRunning = false;
  }

  void stop() {
    isStopped = true;
    reinitializeSession();
  }

  void startNewSession(CycleType cycleType) {
    setCycleFocusAndPause(cycleType);

    if(isRunning) {
      timerService.stopTimer();
    }

    isStopped = false;

    currentSession = databaseService.createSession();
    currentCycle = databaseService.createCycle(currentSession!);

    currentCycleNumber=0;
    timerService.setTimerDuration(cycleFocusTime);
    timerService.startTimer();
    isFocus = true;
    isRunning = true;
  }

  void reinitializeSession() {
    currentCycleNumber=0;
    isRunning = false;
    timerService.stopTimer();
    timerService.setTimerDuration(0);
  }

  void setCycleFocusAndPause(CycleType cycleType) {
    if(cycleType == CycleType.LONG) {
      cycleFocusTime = 45*60; // 40min in seconds
      cyclePauseTime = 15*60; // 15min in seconds
    } else if (cycleType == CycleType.SHORT) {
      cycleFocusTime = 25*60; // 25min in seconds
      cyclePauseTime = 5*60; // 5min in seconds
    } else {
      cycleFocusTime = 10; 
      cyclePauseTime = 5;
    }
  }

  void _onTimerUpdated() {
    notifyListeners();

    if(isStopped) return;

    if(isFocus) storeCycleData();

    if(timerService.timeLeft != 0) return;

    if(isFocus) {
      isFocus = false;
      timerService.setTimerDuration(cyclePauseTime);
      triggeredPomodoroNotification();
    } else {
      isFocus = true;
      currentCycleNumber = (currentCycleNumber + 1)%cyclesNumber;
      currentCycle = databaseService.createCycle(currentSession!);
      timerService.setTimerDuration(cycleFocusTime);
      triggeredPomodoroNotification();
    }
  }

  void storeCycleData() {
    currentCycle?.focusTime = cycleFocusTime.round() - timerService.timeLeft.round();
    databaseService.updateCycle(currentCycle!);
  }

  void triggeredPomodoroNotification() {
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 0,
        channelKey: "pomodoro_channel",
        actionType: ActionType.Default,
        title: !isFocus ? "Time to take a break" : "Time to go back to work",
        body: !isFocus ? "You have completed a cycle. Take a break." : "Break is over. Go back to work now or consequences.",
        category: NotificationCategory.Reminder,
      )
    );
  }

  Future<List<HistoryItem>> getHistory() async {
    List<Session> sessions = await databaseService.getAllSessions();
    List<HistoryItem> historyItems = List.empty(growable: true);

    for (var session in sessions) {
      var cycles = await databaseService.getCyclesForSession(session.id);
      var cycleCount = cycles.length; 
      session.totalFocusTime = cycles.fold(0, (previousValue, cycle) => previousValue + cycle.focusTime);
      historyItems.add(HistoryItem(session: session, cycleCount: cycleCount));
    }

    return historyItems;
  }

}