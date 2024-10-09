import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

const cycleNumber = 4;

class Cycles extends StatelessWidget {
  Widget getCycles() {
    List<Widget> cycles = List<Widget>.empty(growable: true);

    for (var i = 0; i < cycleNumber; i++) {
      if (i != 0) {
        cycles.add(SizedBox(width: 10));
      }
      cycles.add(Icon(LucideIcons.diamond, size: 16));
    }

    return Row(mainAxisAlignment: MainAxisAlignment.center, children: cycles);
  }

  @override
  Widget build(BuildContext context) {
    return getCycles();
  }
}
