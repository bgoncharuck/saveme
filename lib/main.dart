import 'package:flutter/material.dart';
import 'package:saveme/style/themes.dart';
import 'package:saveme/routes/home.dart';
import 'package:saveme/routes/settings.dart';
import 'package:saveme/routes/numbers.dart';
import 'package:saveme/routes/numbers_add.dart';
import 'package:saveme/modules/numbers_list.dart';
import 'package:saveme/modules/timer.dart';
import 'package:saveme/widgets/error_message.dart';
import 'package:permission_handler/permission_handler.dart';

void main() => runApp(SaveMe());

class SaveMe extends StatefulWidget {
  @override
  _SaveMeState createState() => _SaveMeState();
}

class _SaveMeState extends State<SaveMe> {
  Widget _homeWidget = SaveMeNumbersAdd();
  Widget _afterNumberAdded = SaveMeSettings();

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
      if (await callTimer.readTimerSettingFromFileSystem)
        setState(() {
          _afterNumberAdded = SaveMeNumbers();
        });
      else
        setState(() {
          callTimer.updateTimerSettingOnFileSystem;
        });
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
          '/numbers/added': (BuildContext context) => _afterNumberAdded,
        },
      );
}
