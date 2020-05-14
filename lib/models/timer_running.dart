import 'dart:async';

import 'package:flutter/cupertino.dart';

StreamController<int> currentMinute = StreamController<int>();
StreamController<int> currentSecond = StreamController<int>();

abstract class TimerRunningCommand {
  DateTime id;
  bool get isStop;
  bool get isNotStop;
  void start({double minutes = 0, double seconds = 0, Future onFinish()});
  void stop({DateTime id});
}

class OneTimerInvoker implements TimerRunningCommand {
  DateTime id = DateTime.now();
  DateTime currentTimer;
  Map<DateTime, TimerRunningCommand> _timers = {};

  bool get isStop => _timers.isEmpty;
  bool get isNotStop => _timers.isNotEmpty;

  @override
  void start({double minutes = 0, double seconds = 0, Future onFinish()}) {
    this.stop();
    TimerRunningCommand current = StoppedByBooleanCheckTimer(
        minutes: minutes, seconds: seconds, onFinish: onFinish);
    _timers.putIfAbsent(current.id, () {
      currentTimer = current.id;
      return current;
    });
    _timers[currentTimer].start();
  }

  @override
  void stop({DateTime id}) {
    if (_timers.isNotEmpty) {
      _timers.forEach((DateTime started, TimerRunningCommand timer) {
        timer.stop();
      });
      _timers.clear();
    }
  }
}

class StoppedByBooleanCheckTimer implements TimerRunningCommand {
  DateTime id;
  double _minute;
  double _second;
  bool _isStopped = true;

  StoppedByBooleanCheckTimer(
      {@required double minutes,
      @required double seconds,
      @required Future onFinish()}) {
    id = DateTime.now();
    _minute = minutes;
    _second = seconds;
  }

  bool get isStop => _isStopped;
  bool get isNotStop => !_isStopped;

  void start({double minutes = 0, double seconds = 0, Future onFinish()}) {
    _isStopped = false;
    if (minutes != 0 || seconds != 0)
      Timer.periodic(Duration(seconds: 1), (ticks) {
        if (_second-- == 0) {
          if (_minute == 0) {
            // Main magic
            if (this.isNotStop) onFinish();
            //
            _isStopped = true;
            ticks.cancel();
          } else if (_minute-- > 0) _second = 60;
        }
        currentMinute.add(_minute.toInt());
        currentSecond.add(_second.toInt());
      });
    // if timer set to 0 minutes and 0 seconds
    else if (this.isNotStop) onFinish();
    _isStopped = true;
  }

  void stop({DateTime id}) => _isStopped = true;
}
