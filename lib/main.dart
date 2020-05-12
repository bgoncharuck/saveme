import 'package:flutter/material.dart';
import 'package:saveme/style/themes.dart';
import 'package:saveme/routes/home.dart';
import 'package:saveme/routes/settings.dart';
import 'package:saveme/routes/numbers.dart';
import 'package:saveme/modules/numbers_list.dart';
import 'package:saveme/routes/numbers_add.dart';
import 'package:saveme/widgets/error_message.dart';

void main() => runApp(SaveMe());

class SaveMe extends StatefulWidget {
  @override
  _SaveMeState createState() => _SaveMeState();
}

class _SaveMeState extends State<SaveMe> {
  Widget _homeWidget = Scaffold(
    body: SafeArea(
      child: Center(
        child: Text("Loading..."),
      ),
    ),
  );

  Future _loadFiles() async {
    if (await readNumbersFromFileSystemIfAny) {
      print("Access was granted and files loaded");
      setState(() {
        if (atLeastOneNumberExist)
          _homeWidget = SaveMeHome();
        else
          _homeWidget = SaveMeNumbersAdd();
      });
    } else {
      print("Access to filesystem denied for some reason.");
      setState(() {
        _homeWidget = SaveMeErrorMessage(
          "My Lord, you did not grant me access to a storage.\nI can't save or load these config files:\n",
          "timer_setting.json $numbersListSaveFileName",
        );
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _loadFiles();
  }

  Widget build(BuildContext context) => MaterialApp(
        theme: saveMeLight,
        title: 'SaveMe',
        home: _homeWidget,
        routes: <String, WidgetBuilder>{
          '/home': (BuildContext context) => SaveMeHome(),
          '/settings': (BuildContext context) => SaveMeSettings(),
          // @TODO
          '/numbers': (BuildContext context) => SaveMeNumbers(),
          '/numbers/add': (BuildContext context) => SaveMeNumbersAdd(),
        },
      );
}
