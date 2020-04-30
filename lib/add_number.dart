import 'package:flutter/material.dart';
import 'colors.dart';
import 'navigation_button.dart';

class SaveMeAddNumber extends StatefulWidget {
  @override
  _SaveMeAddNumberState createState() => _SaveMeAddNumberState();
}

class _SaveMeAddNumberState extends State<SaveMeAddNumber> {
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
                    icon: Icons.arrow_back,
                    backgroundColor: ColorTheme.darkPrimary,
                    color: ColorTheme.textPrimary),
                Expanded(
                  child: SizedBox(),
                ),
              ],
            ),
            Expanded(
              child: Center(
                child: Text("Add Number"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
