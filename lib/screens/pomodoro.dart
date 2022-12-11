import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomodoro/widgets/time-entrance.dart';
import 'package:pomodoro/widgets/stopwatch.dart';
import 'package:provider/provider.dart';

import '../store/pomodoro.store.dart';

class Pomodoro extends StatelessWidget {
  const Pomodoro({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Expanded(
            child: Stopwatch(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Observer(
              builder: (_) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TimeEntrance(
                    title: 'Work',
                    value: store.workTime,
                    incrementFunction: (store.isResting() || !store.started)
                        ? store.incrementWorkTime
                        : null,
                    decrementFunction: (store.isResting() || !store.started)
                        ? store.decrementWorkTime
                        : null,
                  ),
                  TimeEntrance(
                    title: 'Rest',
                    value: store.restTime,
                    incrementFunction: (store.isWorking() || !store.started)
                        ? store.incrementRestTime
                        : null,
                    decrementFunction: (store.isWorking() || !store.started)
                        ? store.decrementRestTime
                        : null,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
