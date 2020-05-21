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
      Permission.phone,
    ].request();
  }

  Future<Widget> _chooseHomeScreenDependingOnLoadedFiles() async {
    if (_statusOf[Permission.phone].isGranted == false)
      return SaveMeErrorMessage(
        "Can't call",
        "",
      );
    if (_statusOf[Permission.storage].isGranted) {
      bool isNotNull = true;
      try {
        isNotNull = await callTimer.readTimerSettingFromFileSystem;
      } catch (fileNotExistError) {} finally {
        if (!isNotNull) callTimer.updateTimerSettingOnFileSystem;
      }

      try {
        if (await numbers.readFromFileSystemIfAny) {
          print("Access was granted and files loaded.");
          // on default case
          if (numbers.atLeastOneNumberExist) return SaveMeHome();
        }
      } catch (fileNotExistError) {} finally {
        numbers.updateOnFileSystem;
      }
    } else {
      print("Access to filesystem denied for some reason.");
      // on access error will show up
      return SaveMeErrorMessage(
        language.loadFilesAccessErrorText,
        "$timerSettingSaveFileName $numbersListSaveFileName",
      );
    }
    // on first load
    return SaveMeSettings();
  }

  _checkContactListPermissionStatus() {
    if (_statusOf[Permission.contacts].isGranted) {
      print("Access to contacts was granted.");
    } else
      print("Access to contacts was not granted.");
  }

  Future asyncInitPart() async {
    await _getPermissionsIfAny();
    _homeWidget = await _chooseHomeScreenDependingOnLoadedFiles();
    setState(() {});
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
