import 'package:matedoro_flutter/models/pomodoro_session.dart';

class WorkSession {
  final String id;
  final int date;
  final int totalFocusTime;
  final List<PomodoroSession>? pomodoroSessions;


  const WorkSession({
    required this.id,
    required this.date,
    required this.totalFocusTime,
    this.pomodoroSessions
  });

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'date': date,
      'total_focus_time': totalFocusTime,
    };
  }
}