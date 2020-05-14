import 'package:flutter/material.dart';

import 'package:saveme/widgets/main_button.dart';
import 'package:saveme/widgets/navigation_button.dart';
import 'package:saveme/widgets/timer_view.dart';

class SaveMeHome extends StatefulWidget {
  @override
  State<SaveMeHome> createState() => _SaveMeHomeState();
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
            TimerView(),
            SaveMeMainButton(),
          ],
        ),
      ),
    );
  }
}
