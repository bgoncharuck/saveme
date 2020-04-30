import 'package:flutter/material.dart';
import 'colors.dart';
import 'timer.dart';

abstract class _ButtomState {
  String text;
  Color color;
  bool stopped;
}

class _Running implements _ButtomState {
  String text = "Stop";
  Color color = ColorTheme.accent;
  bool stopped = false;
}

class _Stopped implements _ButtomState {
  String text = "Start";
  Color color = ColorTheme.darkPrimary;
  bool stopped = true;
}

class SaveMeMainButton extends StatefulWidget {
  @override
  _SaveMeMainButtonState createState() => _SaveMeMainButtonState();
}

class _SaveMeMainButtonState extends State<SaveMeMainButton> {
  static final _ButtomState run = _Running();
  static final _ButtomState stop = _Stopped();
  _ButtomState buttomState = run;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FlatButton(
          color: buttomState.color,
          textColor: ColorTheme.defaultPrimary,
          onPressed: () {
            setState(() {
              if (buttomState.stopped) {
                buttomState = run;
              } else {
                buttomState = stop;
                CallTimer.stop();
              }
            });
          },
          child: Row(
            children: <Widget>[
              Expanded(
                child: Center(
                  child: Text(
                    buttomState.text,
                    style:
                        TextStyle(fontSize: 96, color: ColorTheme.textPrimary),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
