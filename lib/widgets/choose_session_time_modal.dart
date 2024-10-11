import 'package:flutter/material.dart';
import 'package:matedoro_flutter/providers/pomodoro.provider.dart';
import 'package:provider/provider.dart';

class ChooseSessionTimeModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // throw UnimplementedError();

    final pomodoroProvider = Provider.of<PomodoroProvider>(context);

    onChooseCycle(CycleType cycleType) {
      pomodoroProvider.startNewPomodoroSession(cycleType);
      Navigator.pop(context);
    }

    return SizedBox(
        child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Choose your session duration", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),),
          SizedBox(height: 40),
          OutlinedButton(
              style: ButtonStyle(
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          side: BorderSide(
                              color: const Color.fromARGB(255, 255, 0, 0)
                                  .withOpacity(1),
                              width: 10))),
                  padding:
                      WidgetStateProperty.all<EdgeInsets>(EdgeInsets.all(20)),
                  backgroundColor: WidgetStateProperty.all<Color>(
                      const Color.fromARGB(255, 255, 255, 255)
                          .withOpacity(0.5))),
              onPressed: () =>
                  onChooseCycle(CycleType.LONG),
              child: Text("25min / 5min")),
          SizedBox(height: 20),
          OutlinedButton(
              style: ButtonStyle(
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          side: BorderSide(
                              color: const Color.fromARGB(255, 255, 0, 0)
                                  .withOpacity(1),
                              width: 10))),
                  padding:
                      WidgetStateProperty.all<EdgeInsets>(EdgeInsets.all(20)),
                  backgroundColor: WidgetStateProperty.all<Color>(
                      const Color.fromARGB(255, 255, 255, 255)
                          .withOpacity(0.5))),
              onPressed: () =>
                  onChooseCycle(CycleType.SHORT),
              child: Text("15min / 5min")),
        ],
      ),
    ));
  }
}
