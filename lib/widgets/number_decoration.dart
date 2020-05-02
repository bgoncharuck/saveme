import 'package:flutter/material.dart';
import 'package:saveme/style/themes.dart';
import 'package:saveme/models/number.dart';

class INumberDecoration extends StatefulWidget {
  final INumber inDecoration;
  final Widget _decoration;
  INumberDecoration._decorate(this.inDecoration, this._decoration);
  @override
  _INumberDecorationState createState() => _INumberDecorationState();
}

class _INumberDecorationState extends State<INumberDecoration> {
  @override
  Widget build(BuildContext context) {
    return widget._decoration;
  }
}

class NumbersListDecoration extends INumberDecoration {
  final INumber inDecoration;
  NumbersListDecoration(this.inDecoration)
      : super._decorate(
            inDecoration,
            Column(
              children: <Widget>[
                Text(inDecoration.text, style: TextStyle(fontSize: 32.0)),
                Divider(color: DefaultTheme.colorScheme.onSurface),
              ],
            ));
}
