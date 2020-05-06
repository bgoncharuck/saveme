import 'package:flutter/material.dart';
import 'package:saveme/style/themes.dart';

abstract class ISaveMeTimer {
  double minutes;
  double seconds;
  double minute;
  double second;
  void stop();
}

class DefaultTimer implements ISaveMeTimer {
  double minutes = 3.0;
  double seconds = 30.0;
  double minute = 3.0;
  double second = 30.0;

  @override
  void stop() {
    minute = minutes;
    second = seconds;
  }
}

class TimerView extends StatefulWidget {
  @override
  _TimerViewState createState() => _TimerViewState();
}

class _TimerViewState extends State<TimerView> {
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
              style: TextStyle(fontSize: 32, color: DefaultTheme.buttonColor),
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
              style: TextStyle(fontSize: 32, color: DefaultTheme.buttonColor),
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
  _TimerConfigState() {
    timerWasSet = true;
  }
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
            Text("${callTimer.minutes.toInt()} ",
                style: TextStyle(fontSize: 48)),
            Text("minutes", style: TextStyle(fontSize: 24)),
          ],
        ),
        Slider(
          value: callTimer.minutes,
          min: 0.0,
          max: 60.0,
          divisions: 60,
          onChanged: (double changed) {
            setState(() {
              callTimer.minutes = changed;
            });
          },
          onChangeEnd: (double changed) {
            setState(() {
              callTimer.minutes = changed;
              callTimer.stop();
            });
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: <Widget>[
            Text("${callTimer.seconds.toInt()} ",
                style: TextStyle(fontSize: 48)),
            Text("seconds", style: TextStyle(fontSize: 24)),
          ],
        ),
        Slider(
          value: callTimer.seconds,
          min: 0.0,
          max: 60.0,
          divisions: 60,
          onChanged: (double changed) {
            setState(() {
              callTimer.seconds = changed;
            });
          },
          onChangeEnd: (double changed) {
            setState(() {
              callTimer.seconds = changed;
              callTimer.stop();
            });
          },
        ),
      ],
    );
  }
}

final ISaveMeTimer callTimer = DefaultTimer();
bool timerWasSet = false;
