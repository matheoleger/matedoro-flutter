import 'package:flutter/material.dart';
import 'package:matedoro_flutter/models/history_item.dart';

class HistoryItemWidget extends StatelessWidget{
  final HistoryItem historyItem;

  const HistoryItemWidget({required this.historyItem});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(children: [
        Text(DateTime.fromMicrosecondsSinceEpoch(int.parse(historyItem.session.date)).toString()),
        Text(historyItem.cycleCount.toString()),
        Text(historyItem.session.totalFocusTime.toString()),
      ],) ,
    );
  }
}