import 'package:flutter/material.dart';
import 'colors.dart';
import 'home.dart';
import 'settings.dart';

void main() => runApp(SaveMe());

class SaveMe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SaveMe',
      theme: ThemeData.dark(),
      home: SaveMeHome(),
      routes: <String, WidgetBuilder>{
        '/settings': (BuildContext context) => SaveMeSettings(),
      },
    );
  }
}
