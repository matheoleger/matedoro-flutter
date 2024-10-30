import 'package:matedoro_flutter/models/cycle.dart';

class Session {
  String id;
  String date;
  int totalFocusTime;
  List<Cycle>? cycles;


  Session({
    required this.id,
    required this.date,
    required this.totalFocusTime,
  });

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'date': date,
      'total_focus_time': totalFocusTime,
    };
  }

  static Session fromMap(Map<String, Object?> map) {
    return Session(
      id: map['id'] as String,
      date: map['date'] as String,
      totalFocusTime: map['total_focus_time'] as int,
    );
  }
}