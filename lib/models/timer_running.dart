import 'dart:async';

import 'package:flutter/cupertino.dart';

abstract class IInnerTimer {
  bool get isRunning;
  bool get isNotRunning;
  Function minutesAndSecondsUpdate(
      {@required StreamController<int> minutes,
      @required StreamController<int> seconds});
  void start({double minutes = 0, double seconds = 0, Future onFinish()});
  void stop();
}

class StopwatchInnerTimer implements IInnerTimer {
  Stopwatch _innerTimer = Stopwatch();
  Duration _timerDuration;

  bool get isRunning => _innerTimer.isRunning;
  bool get isNotRunning => !_innerTimer.isRunning;

  @override
  Function minutesAndSecondsUpdate(
      {@required StreamController<int> minutes,
      @required StreamController<int> seconds}) {
    final millisecondsRemaining =
        _timerDuration.inMilliseconds - _innerTimer.elapsed.inMilliseconds;
  }

  @override
  void start({double minutes = 0, double seconds = 0, Future onFinish()}) {}
  @override
  void stop() => _innerTimer.stop();
}
