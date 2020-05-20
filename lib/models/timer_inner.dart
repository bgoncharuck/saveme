import 'dart:async';

abstract class IInnerTimer {
  bool get isRunning;
  bool get isNotRunning;
  StreamController<int> get minute;
  StreamController<int> get second;
  void get updateInnerTimer;
  void start({double minutes = 0, double seconds = 0, Function onFinish});
  void stop();
}

class StopwatchInnerTimer implements IInnerTimer {
  Stopwatch _innerTimer = Stopwatch();
  Duration _timerDuration;
  Function _onFinish;
  final StreamController<int> minute = StreamController<int>.broadcast();
  final StreamController<int> second = StreamController<int>.broadcast();
  bool get isRunning => _innerTimer.isRunning;
  bool get isNotRunning => !_innerTimer.isRunning;

  void get updateInnerTimer {
    if (_innerTimer.elapsedMilliseconds >= _timerDuration.inMilliseconds) {
      this.stop();
      this._onFinish();
    }

    final remaining =
        _timerDuration.inMilliseconds - _innerTimer.elapsed.inMilliseconds;

    minute.add(((remaining / (1000 * 60)) % 60).toInt());
    second.add(((remaining / 1000) % 60).toInt());
  }

  @override
  void start({double minutes = 0, double seconds = 0, Function onFinish}) {
    this._onFinish = onFinish;
    this._timerDuration =
        Duration(minutes: minutes.toInt(), seconds: seconds.toInt() + 2);
    this._innerTimer.start();
  }

  @override
  void stop() {
    this._innerTimer.reset();
    this._innerTimer.stop();
    print("Timer was stopped.");
  }
}
