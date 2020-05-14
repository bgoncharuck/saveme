import 'dart:async';

import 'package:flutter/cupertino.dart';

abstract class TimerRunningCommand {
  DateTime id;
  double get minute;
  double get second;
  bool get isStop;
  bool get isNotStop;
  void start({double minutes = 0, double seconds = 0, Future onFinish()});
  void stop({DateTime id});
}

class OneTimerInvoker implements TimerRunningCommand {
  DateTime id = DateTime.now();
  DateTime currentTimer;
  Map<DateTime, TimerRunningCommand> _timers = {};

  double get minute => _timers[currentTimer].minute;
  double get second => _timers[currentTimer].second;
  bool get isStop => _timers.isEmpty;
  bool get isNotStop => _timers.isNotEmpty;

  @override
  void start({double minutes = 0, double seconds = 0, Future onFinish()}) {}

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
    _minute = minutes;
    _second = seconds;
    this.start(minutes: minutes, seconds: seconds, onFinish: onFinish);
  }

  double get minute => _minute;
  double get second => _second;
  bool get isStop => _isStopped;
  bool get isNotStop => !_isStopped;

  void start({double minutes = 0, double seconds = 0, Future onFinish()}) {
    _isStopped = false;
    if (minutes != 0 || seconds != 0)
      Timer.periodic(Duration(seconds: 1), (ticks) {
        if (_second == 0) {
          if (_minute == 0) {
            // Main magic
            if (this.isNotStop) onFinish();
            //
            _isStopped = true;
            ticks.cancel();
          } else if (_minute-- > 0) _second = 60;
        }
      });
    // if timer set to 0 minutes and 0 seconds
    else if (this.isNotStop) onFinish();
    _isStopped = true;
  }

  void stop({DateTime id}) => _isStopped = true;
}
