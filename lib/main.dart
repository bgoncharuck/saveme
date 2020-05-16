import 'package:flutter/material.dart';
import 'package:saveme/constants.dart';
import 'package:saveme/theme/style.dart';
import 'package:saveme/screens/home.dart';
import 'package:saveme/screens/settings.dart';
import 'package:saveme/screens/numbers.dart';
import 'package:saveme/screens/numbers_add.dart';
import 'package:saveme/modules/numbers_list.dart';
import 'package:saveme/components/error_message.dart';
import 'package:permission_handler/permission_handler.dart';

void main() => runApp(SaveMe());

class SaveMe extends StatefulWidget {
  @override
  _SaveMeState createState() => _SaveMeState();
}

class _SaveMeState extends State<SaveMe> {
  Widget _homeWidget = SaveMeSettings();

  Future _loadFiles() async {
    if (await Permission.storage.request().isGranted) {
      if (await readNumbersFromFileSystemIfAny) {
        print("Access was granted and files loaded");
        setState(() {
          if (atLeastOneNumberExist) _homeWidget = SaveMeHome();
        });
      } else
        setState(() {
          updateListOnFileSystem;
        });
      if (await callTimer.readTimerSettingFromFileSystem != true)
        setState(() {
          callTimer.updateTimerSettingOnFileSystem;
        });
      else
        setState(() {});
    } else {
      print("Access to filesystem denied for some reason.");
      setState(() {
        _homeWidget = SaveMeErrorMessage(
          "My Lord, you did not grant me access to a storage.\nI can't save or load these config files:\n",
          "$timerSettingSaveFileName $numbersListSaveFileName",
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
          '/numbers': (BuildContext context) => SaveMeNumbers(),
          '/numbers/add': (BuildContext context) => SaveMeNumbersAdd(),
        },
      );
}
