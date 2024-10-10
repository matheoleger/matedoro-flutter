import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:matedoro_flutter/providers/pomodoro.provider.dart';
import 'package:provider/provider.dart';

const cycleNumber = 4;

class Cycles extends StatelessWidget {


  Widget getCycles(PomodoroProvider pomodoroProvider) {
    List<Widget> cycles = List<Widget>.empty(growable: true);

    for (var i = 0; i < cycleNumber; i++) {
      if (i != 0) {
        cycles.add(SizedBox(width: 10));
      }
      // cycles.add(Icon(LucideIcons.diamond, size: 16, fill: 1));
      var currentCycle = pomodoroProvider.currentCycle;

      if(currentCycle < i) {
        cycles.add(SvgPicture.asset('assets/icons/diamond.svg', width: 16, height: 16, colorFilter: ColorFilter.mode(const Color.fromARGB(255, 0, 0, 0), BlendMode.srcIn),));
      } else if (currentCycle == i) {
        cycles.add(SvgPicture.asset('assets/icons/square_filled.svg', width: 16, height: 16, colorFilter: ColorFilter.mode(const Color.fromARGB(255, 0, 0, 0), BlendMode.srcIn),));
      } else {
        cycles.add(SvgPicture.asset('assets/icons/diamond_filled.svg', width: 16, height: 16, colorFilter: ColorFilter.mode(const Color.fromARGB(255, 0, 0, 0), BlendMode.srcIn),));
      }
    }

    return Row(mainAxisAlignment: MainAxisAlignment.center, children: cycles);
  }

  @override
  Widget build(BuildContext context) {
    final pomodoroProvider = Provider.of<PomodoroProvider>(context); 
    return getCycles(pomodoroProvider);
  }
}
