import 'package:flutter/material.dart';
import 'package:saveme/constants.dart';

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
          padding: const EdgeInsets.only(
            top: 32,
            left: 8,
            right: 1,
            bottom: 16,
          ),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Icon(
                        Icons.notification_important,
                        color: defaultTheme.mainColor,
                        size: 32.0,
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          text: "1. ",
                          style: TextStyle(fontSize: 16.0),
                          children: <TextSpan>[
                            TextSpan(
                              text:
                                  "${language.setTheCallingTimerDescription[0]} ",
                            ),
                            TextSpan(
                              text:
                                  "${language.setTheCallingTimerDescription[1]}.",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: "2. ",
                          style: TextStyle(fontSize: 16.0),
                          children: <TextSpan>[
                            TextSpan(
                              text:
                                  "${language.setTheCallingTimerDescription[2]} ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text:
                                  "${language.setTheCallingTimerDescription[3]}.",
                            ),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: "3. ",
                          style: TextStyle(fontSize: 16.0),
                          children: <TextSpan>[
                            TextSpan(
                              text:
                                  "${language.setTheCallingTimerDescription[4]} ",
                            ),
                            TextSpan(
                              text:
                                  "${language.setTheCallingTimerDescription[5]} ",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: defaultTheme.mainColor),
                            ),
                            TextSpan(
                              text:
                                  "${language.setTheCallingTimerDescription[6]}.",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
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
