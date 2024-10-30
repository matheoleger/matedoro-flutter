import 'package:flutter/material.dart';
import 'package:matedoro_flutter/models/history_item.dart';
import 'package:matedoro_flutter/utils/utils.dart';
import 'package:intl/intl.dart';

class HistoryItemWidget extends StatelessWidget {
  final HistoryItem historyItem;

  const HistoryItemWidget({required this.historyItem});

  @override
  Widget build(BuildContext context) {
    // var formattedDate = DateTime.fromMicrosecondsSinceEpoch(int.parse(historyItem.session.date) * 1000).toString();
    var dateFormat = DateFormat("MM/dd");
    var date = DateTime.fromMicrosecondsSinceEpoch(
        int.parse(historyItem.session.date) * 1000);

    // var formattedDate = DateTime.fromMicrosecondsSinceEpoch(int.parse(historyItem.session.date) * 1000).toString();
    var formattedTotalFocusTime =
        getFormattedTimeForHistory(historyItem.session.totalFocusTime * 1.0);

    return Center(
        child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            margin: const EdgeInsets.only(
                left: 20.0, right: 20.0, top: 10, bottom: 10),
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    children: [
                      // Text("${date.day}/${date.month}"),
                      Text(
                        dateFormat.format(date),
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(date.year.toString(), style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
                    ],
                  ),
                  SizedBox(
                    width: 80,
                  ),
                  Column(
                    children: [
                      Text(historyItem.cycleCount.toString(),
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      Text("cycles", style: TextStyle(fontSize: 14)),
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      Text(formattedTotalFocusTime,
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      // SizedBox(
                      //   height: 4,
                      // ),
                      Text("focus time", style: TextStyle(fontSize: 14)),
                    ],
                  )
                ],
              ),
            )));
  }
}
