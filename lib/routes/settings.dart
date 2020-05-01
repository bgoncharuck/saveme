import 'package:flutter/material.dart';
import 'package:saveme/widgets/navigation_button.dart';
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
                Expanded(
                  child: SizedBox(),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0),
                ),
                padding: EdgeInsets.all(1.0),
                onPressed: () {
                  setState(() {
                    Navigator.of(context).pushNamed("/numbers/add");
                  });
                },
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                        top: 1.0,
                        bottom: 1.0,
                        left: 10.0,
                        right: 2.0,
                      ),
                      child: Icon(
                        Icons.smartphone,
                        color: Colors.black,
                        size: 32.0,
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              " +380960123456 ",
                              style:
                                  TextStyle(fontSize: 32, color: Colors.black),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Icon(
                              Icons.file_download,
                              color: Colors.black,
                              size: 28.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TimerConfig(),
            ),
            RaisedButton(
              onPressed: () {
                setState(() {
                  Navigator.of(context).pushNamed("/numbers");
                });
              },
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(64.0),
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 30),
                  Text(
                    " Additional Numbers List ",
                    style: TextStyle(
                      fontSize: 28,
                    ),
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
