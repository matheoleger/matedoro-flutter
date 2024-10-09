import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:matedoro_flutter/providers/timer.provider.dart';
import 'package:matedoro_flutter/widgets/pomodoro.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider<TimerProvider>(
      create: (_) => TimerProvider(),
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
        primaryColor: Colors.black12,
        // colorScheme: ColorScheme(brightness: brightness, primary: primary, onPrimary: onPrimary, secondary: secondary, onSecondary: onSecondary, error: error, onError: onError, surface: surface, onSurface: onSurface),
        // useMaterial3: true
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  onPlayButton(TimerProvider timerProvider) {
    if (!timerProvider.isRunning) {
      timerProvider.setTimerDuration(1000);
      timerProvider.startTimer();
    } else {
      timerProvider.stopTimer();
    }
  }

  @override
  Widget build(BuildContext context) {
    final timerProvider = Provider.of<TimerProvider>(context);
    return Scaffold(
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
              onPressed: () => onPlayButton(timerProvider),
              child: Icon(LucideIcons.play))
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => print('Coucou Mattéo'),
        tooltip: 'Increment',
        child: const Icon(LucideIcons.plus),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
