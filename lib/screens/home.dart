import 'package:flutter/material.dart';
import 'package:saveme/components/main_button.dart';
import 'package:saveme/components/navigation_button.dart';
import 'package:saveme/components/timer_view.dart';
import 'package:saveme/constants.dart';

class SaveMeHome extends StatelessWidget {
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
                  name: language.settingsNavigationButton,
                  icon: Icons.settings,
                  optionalAction: () {
                    callTimer.stop();
                    // allow return to timer only after settings completed
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/settings', (Route<dynamic> route) => false);
                  },
                ),
                Expanded(
                  child: SizedBox(),
                ),
              ],
            ),
            TimerView(),
            SaveMeMainButton(),
          ],
        ),
      ),
    );
  }
}
