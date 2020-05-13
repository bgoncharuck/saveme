import 'package:flutter/material.dart';
import 'package:saveme/style/themes.dart';
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
      var timerStateFromJSON = json.decode(timerSetting);
      print(timerSetting);
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

class TimerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: SizedBox(),
        ),
        Column(
          children: <Widget>[
            Text(
              "${callTimer.minute.toInt()}",
              style: TextStyle(fontSize: 96),
            ),
            Text(
              "min",
              style: TextStyle(fontSize: 32, color: defaultTheme.mainColor),
            ),
          ],
        ),
        Text(
          "|",
          style: TextStyle(fontSize: 256),
        ),
        Column(
          children: <Widget>[
            Text(
              "${callTimer.second.toInt()}",
              style: TextStyle(fontSize: 96),
            ),
            Text(
              "sec",
              style: TextStyle(fontSize: 32, color: defaultTheme.mainColor),
            ),
          ],
        ),
        Expanded(
          child: SizedBox(),
        ),
      ],
    );
  }
}

class TimerConfig extends StatefulWidget {
  @override
  _TimerConfigState createState() => _TimerConfigState();
}

class _TimerConfigState extends State<TimerConfig> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
          child: Text(
            "Set the Calling timer. Next time you run the app, it starts.",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: <Widget>[
            Text("${callTimer.state.minutes.toInt()} ",
                style: TextStyle(fontSize: 48)),
            Text("minutes", style: TextStyle(fontSize: 24)),
          ],
        ),
        Slider(
          value: callTimer.state.minutes,
          min: 0.0,
          max: 60.0,
          divisions: 60,
          onChanged: (double changed) {
            setState(() {
              callTimer.state.minutes = changed;
            });
          },
          onChangeEnd: (double changed) {
            setState(() {
              callTimer.state.minutes = changed;
              callTimer.stop();
              callTimer.updateTimerSettingOnFileSystem;
            });
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: <Widget>[
            Text("${callTimer.state.seconds.toInt()} ",
                style: TextStyle(fontSize: 48)),
            Text("seconds", style: TextStyle(fontSize: 24)),
          ],
        ),
        Slider(
          value: callTimer.state.seconds,
          min: 0.0,
          max: 60.0,
          divisions: 60,
          onChanged: (double changed) {
            setState(() {
              callTimer.state.seconds = changed;
            });
          },
          onChangeEnd: (double changed) {
            setState(() {
              callTimer.state.seconds = changed;
              callTimer.stop();
              callTimer.updateTimerSettingOnFileSystem;
            });
          },
        ),
      ],
    );
  }
}

final ISaveMeTimer callTimer = DefaultTimer();
