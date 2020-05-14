import 'package:saveme/models/timer_state.dart';
import 'package:saveme/modules/storage_access.dart';
import 'dart:convert';
import 'dart:async';

final String timerSettingSaveFileName = "timer_setting.json";

abstract class ISaveMeTimer {
  ITimerState state;
  Future<ITimerState> save();
  Future<bool> load(ITimerState state);
  Future<bool> get readTimerSettingFromFileSystem;
  Future<bool> get updateTimerSettingOnFileSystem;
  double minute;
  double second;
  void stop();
  void start();
}

class DefaultTimer implements ISaveMeTimer {
  ITimerState state = TimerState(
    minutes: 3,
    seconds: 30,
  );

  double minute;
  double second;

  DefaultTimer() {
    stop();
  }

  @override
  void stop() {
    minute = state.minutes;
    second = state.seconds;
  }

  Future _callingEvent() async {}

  @override
  void start() {
    _callingEvent();
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
      this.stop();
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

final ISaveMeTimer callTimer = DefaultTimer();
