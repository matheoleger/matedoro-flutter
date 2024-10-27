class PomodoroSession {
  final String id;
  final String workSessionId;
  final int pomodoriCount;
  final int focusTime;
  final int breakTime;

  const PomodoroSession({
    required this.id,
    required this.workSessionId,
    required this.pomodoriCount,
    required this.focusTime,
    required this.breakTime,
  });

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'work_session': workSessionId,
      'pomodori_count': pomodoriCount,
      'focus_time': focusTime,
      'break_time': breakTime,
    };
  }
}