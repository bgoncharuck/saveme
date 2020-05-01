import 'package:flutter/material.dart';
import 'package:saveme/style/themes.dart';

class Number extends StatelessWidget {
  String text;
  Number(this.text);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(text, style: TextStyle(fontSize: 32.0)),
        Divider(color: DefaultTheme.colorScheme.onSurface),
      ],
    );
  }
}
