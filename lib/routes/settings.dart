import 'package:flutter/material.dart';
import 'package:saveme/style/themes.dart';
import 'package:saveme/widgets/navigation_button.dart';
import 'package:saveme/widgets/main_number.dart';
import 'package:saveme/modules/timer.dart';

class SaveMeSettings extends StatefulWidget {
  @override
  _SaveMeSettingsState createState() => _SaveMeSettingsState();
}

class _SaveMeSettingsState extends State<SaveMeSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                NavigationButton(
                  navigate: "/numbers",
                  name: "Numbers To Call",
                  icon: Icons.list,
                ),
                Expanded(
                  child: SizedBox(),
                ),
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  TimerConfig(),
                  MainNumber(),
                ],
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                    child: Container(
                  color: Colors.grey[800],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.alarm_off, color: Colors.white),
                      Text(
                        "Timer Was Stopped",
                        style: TextStyle(color: Colors.white),
                      ),
                      FlatButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed("/");
                        },
                        child: Text(
                          "Start Again",
                          style: TextStyle(
                              fontSize: 18,
                              color: DefaultTheme.buttonColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
