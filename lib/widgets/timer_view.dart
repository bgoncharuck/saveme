import 'package:flutter/material.dart';
import 'package:saveme/style/themes.dart';
import 'package:saveme/modules/timer.dart';

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
