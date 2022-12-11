import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomodoro/store/pomodoro.store.dart';
import 'package:pomodoro/widgets/stopwatch_button.dart';
import 'package:provider/provider.dart';

class Stopwatch extends StatelessWidget {
  const Stopwatch({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);

    return Observer(
      builder: (_) => Container(
        color: store.isWorking() ? Colors.red : Colors.green,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              store.isWorking() ? 'Time to work' : 'Time to rest',
              style: const TextStyle(
                fontSize: 40,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              '${store.minutes.toString().padLeft(2, '0')}:${store.seconds.toString().padLeft(2, '0')}',
              style: const TextStyle(
                fontSize: 120,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (!store.started)
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: StopwatchButton(
                      icon: Icons.play_arrow,
                      text: 'Start',
                      onClickFunction: store.start,
                    ),
                  ),
                if (store.started)
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: StopwatchButton(
                      icon: Icons.stop,
                      text: 'Stop',
                      onClickFunction: store.stop,
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: StopwatchButton(
                    icon: Icons.refresh,
                    text: 'Restart',
                    onClickFunction: store.restart,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
