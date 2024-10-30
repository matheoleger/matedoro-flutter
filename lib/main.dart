import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:matedoro_flutter/pages/home.dart';
import 'package:matedoro_flutter/providers/pomodoro.provider.dart';
import 'package:matedoro_flutter/services/timer_service.dart';
import 'package:matedoro_flutter/services/database_service.dart';
import 'package:provider/provider.dart';

void main() {
  AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
        channelKey: "pomodoro_channel",
        channelName: "Pomodoro notifications",
        channelDescription: "Notification channel for Matedoro app",
        defaultColor: Color.fromARGB(255, 0, 0, 0),
        ledColor: Color.fromARGB(255, 0, 0, 0),
        enableVibration: true,
        soundSource: "resource://raw/res_notification",
      )
    ],
    debug: true,
  );
  runApp(
    ChangeNotifierProvider<PomodoroProvider>(
      create: (_) => PomodoroProvider(timerService: TimerService(), databaseService: DatabaseService()),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Matedoro',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Color.fromARGB(255, 0, 0, 0)
      ),
      home: const MyHomePage(),
    );
  }
}
