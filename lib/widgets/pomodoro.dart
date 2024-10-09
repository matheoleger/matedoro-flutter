import 'package:flutter/material.dart';
import 'package:matedoro_flutter/providers/timer.provider.dart';
import 'package:matedoro_flutter/widgets/cycles.dart';
import 'package:matedoro_flutter/widgets/timer.dart';
import 'package:provider/provider.dart';

class Pomodoro extends StatefulWidget {
  const Pomodoro({super.key});

  @override
  State<Pomodoro> createState() => _PomodoroState();
}

class _PomodoroState extends State<Pomodoro> {
  // int timeLeft = 25000;

  @override
  Widget build(BuildContext context) {
    // final timerProvider = Provider.of<TimerProvider>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Timer(), SizedBox(height: 20), Cycles()],
    );
  }
}
