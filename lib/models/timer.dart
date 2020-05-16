import 'package:saveme/constants.dart';
import 'package:saveme/models/timer_state.dart';
import 'package:saveme/models/timer_inner.dart';
import 'package:flutter/services.dart';
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

  void _callingEvent() {
    print("Calling! Beep beep.");
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  }

  @override
  void update() {
    innerTimer.updateInnerTimer(minute: currentMinute, second: currentSecond);
  }

  @override
  void start() {
    innerTimer.start(
        minutes: state.minutes,
        seconds: state.seconds,
        onFinish: _callingEvent);
  }

  @override
  void stop() {
    if (innerTimer.isNotRunning) innerTimer.stop();
  }

  @override
  Future<ITimerState> save() async => TimerState(
        minutes: state.minutes,
        seconds: state.seconds,
      );

  @override
  Future<bool> load(ITimerState state) async {
    if (state != null) {
      this.state = state;
      return true;
    }
    return false;
  }

  @override
  Future<bool> get readTimerSettingFromFileSystem async {
    String timerSetting =
        await storage.read(fromFile: timerSettingSaveFileName);
    if (timerSetting != null) {
      var loadedTimerState = json.decode(timerSetting);
      this.load(TimerState.fromJSON(loadedTimerState));
      return true;
    }
    return false;
  }

  @override
  Future<bool> get updateTimerSettingOnFileSystem async => await storage.write(
        data: json.encode(this.state),
        asFile: timerSettingSaveFileName,
      );
}
