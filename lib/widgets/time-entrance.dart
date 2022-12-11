import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomodoro/store/pomodoro.store.dart';
import 'package:provider/provider.dart';

class TimeEntrance extends StatelessWidget {
  final String title;
  final int value;
  final void Function()? incrementFunction;
  final void Function()? decrementFunction;

  const TimeEntrance({
    required this.title,
    required this.value,
    this.incrementFunction,
    this.decrementFunction,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);

    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 25,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Observer(
          builder: (_) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: decrementFunction,
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(16),
                  backgroundColor:
                      store.isWorking() ? Colors.red : Colors.green,
                ),
                child: const Icon(
                  Icons.arrow_downward,
                  color: Colors.white,
                ),
              ),
              Text(
                '$value min',
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              ElevatedButton(
                onPressed: incrementFunction,
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(16),
                  backgroundColor:
                      store.isWorking() ? Colors.red : Colors.green,
                ),
                child: const Icon(
                  Icons.arrow_upward,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
