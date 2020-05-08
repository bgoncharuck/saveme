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
  bool _filesLoaded = false;

  Future _loadFiles() async {
    if (await readNumbersFromFileSystemIfAny) {
      print("Access was granted and files loaded");
      _filesLoaded = true;
    } else {
      print("Access to filesystem denied for some reason.");
    }
  }

  Widget build(BuildContext context) {
    this._loadFiles();

    return MaterialApp(
      theme: saveMeLight,
      title: 'SaveMe',
      home: (_filesLoaded && atLeastOneNumberExist)
          ? SaveMeHome()
          : SaveMeNumbersAdd(),
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
