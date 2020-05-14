import 'dart:async';

import 'package:flutter/material.dart';
import 'package:saveme/style/themes.dart';
import 'package:saveme/modules/timer.dart';
import 'package:saveme/models/timer_running.dart';

class TimerView extends StatefulWidget {
  @override
  _TimerViewState createState() => _TimerViewState();
}

class _TimerViewState extends State<TimerView> {
  @override
  initState() {
    callTimer.start();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: SizedBox(),
        ),
        Column(
          children: <Widget>[
            StreamBuilder<int>(
              stream: currentMinute.stream,
              builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                if (snapshot.hasData)
                  return Text(
                    "${snapshot.data}",
                    style: TextStyle(fontSize: 96),
                  );
                else
                  return Text(
                    "${callTimer.state.minutes.toInt()}",
                    style: TextStyle(fontSize: 96),
                  );
              },
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
            StreamBuilder<int>(
              stream: currentSecond.stream,
              builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                if (snapshot.hasData)
                  return Text(
                    "${snapshot.data}",
                    style: TextStyle(fontSize: 96),
                  );
                else
                  return Text(
                    "${callTimer.state.seconds.toInt()}",
                    style: TextStyle(fontSize: 96),
                  );
              },
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
