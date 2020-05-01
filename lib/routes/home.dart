import 'package:flutter/material.dart';
import 'package:saveme/style/themes.dart';
import 'package:saveme/widgets/main_button.dart';
import 'package:saveme/widgets/navigation_button.dart';
import 'package:saveme/modules/timer.dart';

class SaveMeHome extends StatefulWidget {
  @override
  _SaveMeHomeState createState() => _SaveMeHomeState();
}

class _SaveMeHomeState extends State<SaveMeHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                NavigationButton(
                  navigate: "/settings",
                  name: "Settings",
                  icon: Icons.settings,
                ),
                Expanded(
                  child: SizedBox(),
                ),
              ],
            ),
            Row(
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
                      style: TextStyle(
                          fontSize: 32, color: DefaultTheme.buttonColor),
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
                      style: TextStyle(
                          fontSize: 32, color: DefaultTheme.buttonColor),
                    ),
                  ],
                ),
                Expanded(
                  child: SizedBox(),
                ),
              ],
            ),
            SaveMeMainButton(),
          ],
        ),
      ),
    );
  }
}
