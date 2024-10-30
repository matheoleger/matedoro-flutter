import 'package:matedoro_flutter/models/session.dart';

class HistoryItem {
  final Session session;
  final int cycleCount;

  const HistoryItem({required this.session, required this.cycleCount});
}