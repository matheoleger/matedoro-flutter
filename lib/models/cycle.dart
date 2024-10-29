import 'package:matedoro_flutter/models/session.dart';

class Cycle {
  String id;
  String sessionId;
  int focusTime;

  Cycle({
    required this.id,
    required this.sessionId,
    required this.focusTime,
  });

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'session_id': sessionId,
      'focus_time': focusTime,
    };
  }

  static Cycle fromMap(Map<String, Object?> map) {
    return Cycle(
      id: map['id'] as String,
      sessionId: map['session_id'] as String,
      focusTime: map['focus_time'] as int,
    );
  }
}