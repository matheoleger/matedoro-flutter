import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:matedoro_flutter/providers/timer.provider.dart';
import 'package:provider/provider.dart';

class Timer extends StatelessWidget {
  // int elapsedTime;

  @override
  Widget build(BuildContext context) {
    final timerProvider = Provider.of<TimerProvider>(context);

    return DottedBorder(
        borderType: BorderType.RRect,
        dashPattern: [6, 3],
        radius: Radius.circular(100),
        child: Container(
            alignment: Alignment.center,
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              // color: Color.fromARGB(255, 255, 172, 63),
              // border: Border.all(
              //   width: 2,
              //   color: Color.fromARGB(105, 0, 0, 0)
              // )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(LucideIcons.eye),
                Text(timerProvider.timeLeft.toString(), style: TextStyle(fontSize: 44),),
                Text("F O C U S")
              ],
            ) ));
  }
}
