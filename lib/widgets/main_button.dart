import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
                    style: TextStyle(color: Colors.green),
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
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            )
          : FlatButton(
              color: Colors.red,
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
                        style: TextStyle(fontSize: 96, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              )),
    );
  }
}
