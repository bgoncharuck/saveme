import 'package:flutter/material.dart';
import 'package:saveme/style/themes.dart';
import 'package:saveme/routes/home.dart';
import 'package:saveme/routes/settings.dart';
import 'package:saveme/routes/numbers.dart';
import 'package:saveme/routes/numbers_add.dart';
import 'package:saveme/modules/timer.dart';

void main() => runApp(SaveMe());

class SaveMe extends StatefulWidget {
  @override
  _SaveMeState createState() => _SaveMeState();
}

class _SaveMeState extends State<SaveMe> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: DefaultTheme,
      title: 'SaveMe',
      home: SaveMeHome(),
      routes: <String, WidgetBuilder>{
        '/settings': (BuildContext context) => SaveMeSettings(),
        '/numbers': (BuildContext context) =>
            (timerWasSetted) ? SaveMeNumbers() : SaveMeSettings(),
        '/numbers/add': (BuildContext context) => SaveMeNumbersAdd(),
      },
    );
  }
}
