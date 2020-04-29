import 'package:flutter/material.dart';
import 'colors.dart';
import 'navigation_button.dart';

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
            Text("Home"),
          ],
        ),
      ),
    );
  }
}
