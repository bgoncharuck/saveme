import 'package:flutter/material.dart';
import 'main_button.dart';
import 'colors.dart';
import 'navigation_button.dart';
import 'timer.dart';

class SaveMeHome extends StatefulWidget {
  @override
  _SaveMeHomeState createState() => _SaveMeHomeState();
}

class _SaveMeHomeState extends State<SaveMeHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.background,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                NavigationButton(
                    navigate: "/settings",
                    name: "Settings",
                    icon: Icons.settings,
                    backgroundColor: ColorTheme.darkPrimary,
                    color: ColorTheme.textPrimary),
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
                      "${CallTimer.minute}",
                      style: TextStyle(fontSize: 128),
                    ),
                    Text(
                      "min",
                      style: TextStyle(
                          fontSize: 32, color: ColorTheme.defaultPrimary),
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
                      "${CallTimer.second}",
                      style: TextStyle(fontSize: 128),
                    ),
                    Text(
                      "sec",
                      style: TextStyle(
                          fontSize: 32, color: ColorTheme.defaultPrimary),
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
