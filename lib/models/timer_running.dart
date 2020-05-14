import 'dart:async';

abstract class TimerRunningCommand {
  var id;
  double get minute;
  double get second;
  bool get isStop;
  bool get isNotStop;
  void start({double minutes = 0, double seconds = 0, Future onFinish()});
  void stop({DateTime id});
}

class OneTimerInvoker implements TimerRunningCommand {
  var id = DateTime.now();
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
    _timers.forEach((DateTime started, TimerRunningCommand timer) {
      timer.stop();
    });
    _timers.clear();
  }
}
