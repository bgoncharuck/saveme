import 'dart:convert';
import 'dart:async';
import 'package:storage_access/storage_access.dart' as storage;
import 'package:saveme/constants.dart';
import 'package:saveme/models/timer_state.dart';
import 'package:saveme/models/timer_inner.dart';
import 'package:saveme/modules/calling_event.dart';

abstract class ISaveMeTimer {
  ITimerState state;
  Future<ITimerState> save();
  Future<bool> load(ITimerState state);
  Future<bool> get readTimerSettingFromFileSystem;
  Future<bool> get updateTimerSettingOnFileSystem;
  StreamController<int> get currentMinute;
  StreamController<int> get currentSecond;
  void stop();
  void start();
}

class DefaultTimer implements ISaveMeTimer {
  ITimerState state = TimerState(
    minutes: 1,
    seconds: 30,
  );
  IInnerTimer _innerTimer = StopwatchInnerTimer();
  Timer _outerTimer;
  StreamController<int> get currentMinute => _innerTimer.minute;
  StreamController<int> get currentSecond => _innerTimer.second;

  @override
  void start() {
    _innerTimer.start(
        minutes: state.minutes, seconds: state.seconds, onFinish: callingEvent);
    _outerTimer = Timer.periodic(
        Duration(seconds: 1), (Timer t) => _innerTimer.updateInnerTimer);
  }

  @override
  void stop() {
    if (_innerTimer.isRunning) {
      _innerTimer.stop();
      _outerTimer.cancel();
    }
  }

  @override
  Future<ITimerState> save() async => TimerState(
        minutes: state.minutes,
        seconds: state.seconds,
      );

  @override
  Future<bool> load(ITimerState state) async {
    if (state == null) return false;
    this.state = state;
    return true;
  }

  @override
  Future<bool> get readTimerSettingFromFileSystem async {
    String timerSetting =
        await storage.read(fromFile: timerSettingSaveFileName);
    if (timerSetting == null) return false;

    var loadedTimerState = json.decode(timerSetting);
    this.load(TimerState.fromJSON(loadedTimerState));
    return true;
  }

  @override
  Future<bool> get updateTimerSettingOnFileSystem async => await storage.write(
        data: json.encode(this.state),
        asFile: timerSettingSaveFileName,
      );
}
