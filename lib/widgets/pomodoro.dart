import 'package:flutter/material.dart';
import 'package:matedoro_flutter/widgets/cycles.dart';
import 'package:matedoro_flutter/widgets/timer.dart';

class Pomodoro extends StatefulWidget {
  const Pomodoro({super.key});

  @override
  State<Pomodoro> createState() => _PomodoroState();
}

class _PomodoroState extends State<Pomodoro> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Timer(), SizedBox(height: 20), Cycles()],
    );
  }
}
