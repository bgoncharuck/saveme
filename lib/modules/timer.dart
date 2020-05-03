import 'package:flutter/cupertino.dart';
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
              "${CallTimer.minute.toInt()}",
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
              "${CallTimer.second.toInt()}",
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
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: <Widget>[
            Text("${CallTimer.minutes.toInt()} ",
                style: TextStyle(fontSize: 48)),
            Text("minutes", style: TextStyle(fontSize: 24)),
          ],
        ),
        Slider(
          value: CallTimer.minutes,
          min: 0.0,
          max: 60.0,
          divisions: 60,
          onChanged: (double changed) {
            setState(() {
              CallTimer.minutes = changed;
            });
          },
          onChangeEnd: (double changed) {
            setState(() {
              CallTimer.minutes = changed;
              CallTimer.stop();
            });
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: <Widget>[
            Text("${CallTimer.seconds.toInt()} ",
                style: TextStyle(fontSize: 48)),
            Text("seconds", style: TextStyle(fontSize: 24)),
          ],
        ),
        Slider(
          value: CallTimer.seconds,
          min: 0.0,
          max: 60.0,
          divisions: 60,
          onChanged: (double changed) {
            setState(() {
              CallTimer.seconds = changed;
            });
          },
          onChangeEnd: (double changed) {
            setState(() {
              CallTimer.seconds = changed;
              CallTimer.stop();
            });
          },
        ),
      ],
    );
  }
}

final ISaveMeTimer CallTimer = DefaultTimer();
