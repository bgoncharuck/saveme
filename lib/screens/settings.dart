import 'package:flutter/material.dart';
import 'package:saveme/components/contact_number_input.dart';
import 'package:saveme/constants.dart';
import 'package:saveme/components/navigation_button.dart';
import 'package:saveme/components/timer_setting.dart';

class SaveMeSettings extends StatelessWidget {
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
                  name: language.numbersNavigationButton,
                  icon: Icons.list,
                ),
                Expanded(
                  child: SizedBox(),
                ),
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 32),
                    child: ContactNumberInputForm(
                      onEditingComplete: () {},
                      isEditable: true,
                      autofocus: false,
                    ),
                  ),
                  TimerConfig(),
                ],
              ),
            ),
            (numbers.atLeastOneNumberExist)
                ? Row(
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
                              language.startTimerAgainLabel,
                              style: TextStyle(color: Colors.white),
                            ),
                            FlatButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed("/home");
                              },
                              child: Text(
                                language.startTimerAgainAction,
                                style:
                                    TextStyle(fontSize: 18, color: defaultTheme.mainColor, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      )),
                    ],
                  )
                : Container(),
          ],
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
