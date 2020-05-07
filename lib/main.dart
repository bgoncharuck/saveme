import 'package:flutter/material.dart';
import 'package:saveme/style/themes.dart';
import 'package:saveme/routes/home.dart';
import 'package:saveme/routes/settings.dart';
import 'package:saveme/routes/numbers.dart';
import 'package:saveme/routes/numbers_add.dart';
import 'package:saveme/modules/numbers_list.dart';

void main() => runApp(SaveMe());

class SaveMe extends StatefulWidget {
  @override
  _SaveMeState createState() => _SaveMeState();
}

class _SaveMeState extends State<SaveMe> {
  @override
  _SaveMeState() {
    readNumbersFromFileSystemIfAny();
  }
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: saveMeLight,
      title: 'SaveMe',
      home: (atLeastOneNumberExist) ? SaveMeHome() : SaveMeNumbersAdd(),
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => SaveMeHome(),
        '/settings': (BuildContext context) => SaveMeSettings(),
        '/numbers': (BuildContext context) =>
            (isFirstStart) ? SaveMeSettings() : SaveMeNumbers(),
        '/numbers/add': (BuildContext context) => SaveMeNumbersAdd(),
      },
    );
  }
}
