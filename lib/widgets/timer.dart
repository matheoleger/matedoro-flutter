import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:matedoro_flutter/providers/pomodoro.provider.dart';
import 'package:matedoro_flutter/utils/utils.dart';
import 'package:provider/provider.dart';

class Timer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final pomodoroProvider = Provider.of<PomodoroProvider>(context);

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
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(pomodoroProvider.isFocus ? LucideIcons.eye : LucideIcons.feather),
                Text(getFormattedTimer(pomodoroProvider.timerService.timeLeft), style: TextStyle(fontSize: 44),),
                Text(pomodoroProvider.isFocus ? "F O C U S" : "B R E A K")
              ],
            ) ));
  }
}
