import 'dart:async';

import 'package:mobx/mobx.dart';

part 'pomodoro.store.g.dart';

class PomodoroStore = _PomodoroStore with _$PomodoroStore;

enum IntervalType {
  work,
  rest,
}

abstract class _PomodoroStore with Store {
  Timer? stopwatch;

  @observable
  int minutes = 2;

  @observable
  int seconds = 0;

  @observable
  int workTime = 2;

  @observable
  int restTime = 1;

  @observable
  bool started = false;

  @observable
  IntervalType intervalType = IntervalType.work;

  @action
  void incrementWorkTime() {
    workTime++;
    if (isWorking()) {
      minutes = workTime;
      seconds = 0;
    }
    if (isWorking() && started) restart();
  }

  @action
  decrementWorkTime() {
    if (workTime > 1) {
      workTime--;
    }
    if (isWorking()) {
      minutes = workTime;
      seconds = 0;
    }
    if (isWorking() && started) restart();
  }

  @action
  void incrementRestTime() {
    restTime++;
    if (isResting()) {
      minutes = restTime;
      seconds = 0;
    }
    if (isResting() && started) restart();
  }

  @action
  void decrementRestTime() {
    if (restTime > 1) {
      restTime--;
    } else if (isResting()) {
      minutes = restTime;
      seconds = 0;
    }
    if (isResting() && started) restart();
  }

  @action
  void start() {
    started = true;
    stopwatch = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (minutes == 0 && seconds == 0) {
        _changeIntervalType();
      } else if (seconds == 0) {
        seconds = 59;
        minutes--;
      } else {
        seconds--;
      }
    });
  }

  @action
  void stop() {
    started = false;
    stopwatch?.cancel();
  }

  @action
  void restart() {
    started = false;
    stop();
    minutes = isWorking() ? workTime : restTime;
    seconds = 0;
    start();
  }

  void _changeIntervalType() {
    if (isWorking()) {
      intervalType = IntervalType.rest;
      minutes = restTime;
    } else {
      intervalType = IntervalType.work;
      minutes = workTime;
    }
    seconds = 0;
  }

  bool isWorking() => intervalType == IntervalType.work;

  bool isResting() => intervalType == IntervalType.rest;
}
