import 'package:flutter/material.dart';
import 'package:saveme/components/timer_setting_description.dart';
import 'package:saveme/constants.dart';

class TimerConfig extends StatefulWidget {
  @override
  _TimerConfigState createState() => _TimerConfigState();
}

class _TimerConfigState extends State<TimerConfig> {
  @override
  Widget build(BuildContext context) {
    callTimer.updateTimerSettingOnFileSystem;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
            top: 32,
            left: 8,
            right: 1,
            bottom: 16,
          ),
          child: TimerSettingDescription(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: <Widget>[
            Text("${callTimer.state.minutes.toInt()} ",
                style: TextStyle(fontSize: 48)),
            Text(language.minutes, style: TextStyle(fontSize: 24)),
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
            Text(language.seconds, style: TextStyle(fontSize: 24)),
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
              callTimer.updateTimerSettingOnFileSystem;
            });
          },
        ),
      ],
    );
  }
}
