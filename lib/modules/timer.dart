import 'package:flutter/material.dart';

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

class TimerConfig extends StatefulWidget {
  @override
  _TimerConfigState createState() => _TimerConfigState();
}

class _TimerConfigState extends State<TimerConfig> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: SizedBox(),
        ),
        Expanded(
          child: Text(
            "${CallTimer.minutes.toInt()} minutes",
            style: TextStyle(
              fontSize: 24,
            ),
          ),
        ),
        Expanded(
          child: Slider(
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
        ),
        Expanded(
          child: Text(
            "${CallTimer.seconds.toInt()} seconds",
            style: TextStyle(
              fontSize: 24,
            ),
          ),
        ),
        Expanded(
          child: Slider(
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
        ),
        Expanded(
          child: SizedBox(),
        ),
      ],
    );
  }
}

ISaveMeTimer CallTimer = DefaultTimer();
