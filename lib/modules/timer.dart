import 'package:saveme/models/timer_state.dart';
import 'package:saveme/models/timer_running.dart';
import 'package:saveme/modules/storage_access.dart';
import 'dart:convert';
import 'dart:async';

StreamController<int> currentMinute = StreamController<int>();
StreamController<int> currentSecond = StreamController<int>();
final String timerSettingSaveFileName = "timer_setting.json";

abstract class ISaveMeTimer {
  ITimerState state;
  Future<ITimerState> save();
  Future<bool> load(ITimerState state);
  Future<bool> get readTimerSettingFromFileSystem;
  Future<bool> get updateTimerSettingOnFileSystem;

  void stop();
  void start();
}

class DefaultTimer implements ISaveMeTimer {
  ITimerState state = TimerState(
    minutes: 3,
    seconds: 30,
  );


  DefaultTimer() {
    stop();
  }

  Future _callingEvent() async {
    print("Calling! Beep beep.");
  }

  @override
  void start() {
    .start(
        minutes: state.minutes,
        seconds: state.seconds,
        onFinish: _callingEvent);
  }

  @override
  void stop() {
    if (.isNotStop) .stop();
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

final ISaveMeTimer callTimer = DefaultTimer();
