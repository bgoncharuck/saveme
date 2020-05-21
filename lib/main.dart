import 'package:flutter/material.dart';
import 'package:saveme/constants.dart';
import 'package:saveme/theme/style.dart';
import 'package:saveme/screens/home.dart';
import 'package:saveme/screens/settings.dart';
import 'package:saveme/screens/numbers.dart';
import 'package:saveme/screens/numbers_add.dart';
import 'package:saveme/screens/loading.dart';
import 'package:saveme/components/error_message.dart';
import 'package:permission_handler/permission_handler.dart';

void main() => runApp(SaveMe());

class SaveMe extends StatefulWidget {
  @override
  _SaveMeState createState() => _SaveMeState();
}

class _SaveMeState extends State<SaveMe> {
  Widget _homeWidget = LoadingScreen();
  Map<Permission, PermissionStatus> _statusOf;

  Future _getPermissionsIfAny() async {
    _statusOf = await [
      Permission.storage,
      Permission.contacts,
    ].request();
  }

  Future _loadFiles() async {
    // if loaded first time, this will show up
    setState(() {
      _homeWidget = SaveMeSettings();
    });
    if (_statusOf[Permission.storage].isGranted) {
      if (await numbers.readFromFileSystemIfAny) {
        setState(() {
          print("Access was granted and files loaded.");
          if (numbers.atLeastOneNumberExist) _homeWidget = SaveMeHome();
        });
      } else
        setState(() {
          numbers.updateOnFileSystem;
        });
      if (await storage.read(fromFile: timerSettingSaveFileName) == null)
        setState(() {
          callTimer.updateTimerSettingOnFileSystem;
        });
    } else {
      setState(() {
        print("Access to filesystem denied for some reason.");
        _homeWidget = SaveMeErrorMessage(
          language.loadFilesAccessErrorText,
          "$timerSettingSaveFileName $numbersListSaveFileName",
        );
      });
    }
  }

  _checkContactListPermissionStatus() {
    if (_statusOf[Permission.contacts].isGranted) {
      print("Access to contacts was granted.");
    } else {
      print("Access to contacts was not granted.");
    }
  }

  Future asyncInitPart() async {
    await _getPermissionsIfAny();
    await _loadFiles();
    _checkContactListPermissionStatus();
  }

  @override
  void initState() {
    asyncInitPart();
    super.initState();
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
