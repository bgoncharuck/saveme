import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saveme/constants.dart';

class SaveMeMainButton extends StatefulWidget {
  @override
  _SaveMeMainButtonState createState() => _SaveMeMainButtonState();
}

class _SaveMeMainButtonState extends State<SaveMeMainButton> {
  bool showConfirmDialog = false;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: showConfirmDialog
          ? AlertDialog(
              title: Text(language.stopTheTimerAlertTitle),
              content: Text(language.stopTheTimerAlertContent),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    setState(() {
                      showConfirmDialog = false;
                    });
                  },
                  child: Text(
                    language.stopTheTimerAlertActionNo,
                    style: TextStyle(color: defaultTheme.onBackground),
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    setState(() {
                      callTimer.stop();
                      SystemChannels.platform
                          .invokeMethod('SystemNavigator.pop');
                    });
                  },
                  child: Text(
                    language.stopTheTimerAlertActionYes,
                    style: TextStyle(color: defaultTheme.accent),
                  ),
                ),
              ],
            )
          : FlatButton(
              color: defaultTheme.accent,
              onPressed: () {
                setState(() {
                  showConfirmDialog = true;
                });
              },
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Center(
                      child: Text(
                        language.stopTheTimerButtonLabel,
                        style: TextStyle(
                            fontSize: 96, color: defaultTheme.onMainColor),
                      ),
                    ),
                  ),
                ],
              )),
    );
  }
}
