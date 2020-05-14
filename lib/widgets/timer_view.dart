import 'package:flutter/material.dart';
import 'package:saveme/style/themes.dart';
import 'package:saveme/modules/timer.dart';

//callTimer.invoker.minute

class TimerView extends StatefulWidget {
  @override
  _TimerViewState createState() => _TimerViewState();
}

class _TimerViewState extends State<TimerView> {
  @override
  Widget build(BuildContext context) {
    return CurrentTimerView(
        callTimer.state.minutes.toInt(), callTimer.state.seconds.toInt());
  }
}

class CurrentTimerView extends StatelessWidget {
  final int _minute;
  final int _second;
  CurrentTimerView(this._minute, this._second);
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
              "${_minute}",
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
              "${_second}",
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
