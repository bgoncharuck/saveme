import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saveme/theme/style.dart';

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
              title: Text("Stop The Timer?"),
              content: Text("Are you okay?"),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    setState(() {
                      showConfirmDialog = false;
                    });
                  },
                  child: Text(
                    "No",
                    style: TextStyle(color: defaultTheme.mainColor),
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    setState(() {
                      SystemChannels.platform
                          .invokeMethod('SystemNavigator.pop');
                    });
                  },
                  child: Text(
                    "Yes",
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
                        "Stop",
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
