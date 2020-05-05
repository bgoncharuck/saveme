import 'package:flutter/material.dart';
import 'package:saveme/style/themes.dart';
import 'package:saveme/routes/home.dart';
import 'package:saveme/routes/settings.dart';
import 'package:saveme/routes/numbers.dart';
import 'package:saveme/routes/numbers_add.dart';

void main() => runApp(SaveMe());

class SaveMe extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: DefaultTheme,
      title: 'SaveMe',
      home: SaveMeHome(),
      routes: <String, WidgetBuilder>{
        '/settings': (BuildContext context) => SaveMeSettings(),
        '/numbers': (BuildContext context) => SaveMeNumbers(),
        '/numbers/add': (BuildContext context) => SaveMeNumbersAdd(),
      },
    );
  }
}
