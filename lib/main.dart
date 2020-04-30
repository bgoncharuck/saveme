import 'package:flutter/material.dart';
import 'colors.dart';
import 'home.dart';
import 'settings.dart';
import 'add_number.dart';

void main() => runApp(SaveMe());

class SaveMe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SaveMe',
      home: SaveMeHome(),
      routes: <String, WidgetBuilder>{
        '/settings': (BuildContext context) => SaveMeSettings(),
        '/settings/numbers/add': (BuildContext context) => SaveMeAddNumber(),
      },
    );
  }
}