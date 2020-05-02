import 'package:flutter/material.dart';
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
                  navigate: "/",
                  name: "Home",
                  icon: Icons.arrow_back,
                ),
                NavigationButton(
                  navigate: "/numbers",
                  name: "Additional Numbers",
                  icon: Icons.list,
                ),
                Expanded(
                  child: SizedBox(),
                ),
              ],
            ),
            Expanded(child: TimerConfig()),
            MainNumber(),
          ],
        ),
      ),
    );
  }
}
