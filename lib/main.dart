import 'package:flutter/material.dart';
import 'package:pomodoro/screens/pomodoro.dart';
import 'package:provider/provider.dart';
import '../store/pomodoro.store.dart';

void main() {
  runApp(const AppHome());
}

class AppHome extends StatelessWidget {
  const AppHome({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<PomodoroStore>(create: (_) => PomodoroStore()),
      ],
      child: const MaterialApp(
        home: Pomodoro(),
      ),
    );
  }
}
