import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:matedoro_flutter/pages/history.dart';
import 'package:matedoro_flutter/providers/pomodoro.provider.dart';
import 'package:matedoro_flutter/widgets/choose_session_time_modal.dart';
import 'package:matedoro_flutter/widgets/pomodoro.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) => {
      if(!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications()
      }
    });
    super.initState();
  }

  onPlayButton(PomodoroProvider pomodoroProvider) {
    if (!pomodoroProvider.isRunning) {
      pomodoroProvider.play();
    } else {
      pomodoroProvider.pause();
    }
  }

  // onNewButton(PomodoroProvider pomodoroProvider) {
  //   pomodoroProvider.startNewPomodoroSession();
  //   // pomodoroProvider.startTimer();
  // }

  @override
  Widget build(BuildContext context) {
    // final timerProvider = Provider.of<TimerProvider>(context);
    final pomodoroProvider = Provider.of<PomodoroProvider>(context);
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Color.fromARGB(232, 234, 57, 57),
        leading: IconButton(
          icon: Icon(LucideIcons.history),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const HistoryPage();
          }));
          },
        ),
      ),
      body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Pomodoro(),
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
                  // side: WidgetStateProperty.all<BorderSide>(BorderSide(color: Colors.white.withOpacity(0))),
                  padding:
                      WidgetStateProperty.all<EdgeInsets>(EdgeInsets.all(20)),
                  backgroundColor: WidgetStateProperty.all<Color>(
                      const Color.fromARGB(255, 255, 255, 255)
                          .withOpacity(0.5))),
              onPressed: () => onPlayButton(pomodoroProvider),
              child: Icon(pomodoroProvider.isRunning ? LucideIcons.pause : LucideIcons.play, color: Colors.black,))
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) {
                return ChooseSessionTimeModal();
              }),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        tooltip: 'Increment',
        child: const Icon(LucideIcons.plus),
      ), // This trailing comma makes auto-formatting nicer for build methods.
      
    );
  }
}