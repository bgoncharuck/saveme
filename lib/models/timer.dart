import 'package:saveme/constants.dart';
import 'package:saveme/models/timer_state.dart';
import 'package:saveme/models/timer_inner.dart';
import 'package:saveme/modules/calling_event.dart';
import 'dart:convert';
import 'dart:async';

abstract class ISaveMeTimer {
  ITimerState state;
  Future<ITimerState> save();
  Future<bool> load(ITimerState state);
  Future<bool> get readTimerSettingFromFileSystem;
  Future<bool> get updateTimerSettingOnFileSystem;
  IInnerTimer innerTimer;
  void update();
  void stop();
  void start();
}

class DefaultTimer implements ISaveMeTimer {
  ITimerState state = TimerState(
    minutes: 1,
    seconds: 30,
  );
  IInnerTimer innerTimer = StopwatchInnerTimer();

  @override
  void update() {
    innerTimer.updateInnerTimer(minute: currentMinute, second: currentSecond);
  }

  @override
  void start() {
    innerTimer.start(
        minutes: state.minutes, seconds: state.seconds, onFinish: callingEvent);
  }

  @override
  void stop() {
    if (innerTimer.isRunning) innerTimer.stop();
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
