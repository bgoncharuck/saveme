import 'package:flutter/material.dart';
import 'package:saveme/constants.dart';
import 'package:saveme/theme/language.dart';
import 'package:saveme/theme/style.dart';
import 'package:saveme/screens/home.dart';
import 'package:saveme/screens/settings.dart';
import 'package:saveme/screens/numbers.dart';
import 'package:saveme/screens/numbers_add.dart';
import 'package:saveme/components/numbers_list.dart';
import 'package:saveme/components/error_message.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io' show Platform;

void main() => runApp(SaveMe());

class SaveMe extends StatefulWidget {
  @override
  _SaveMeState createState() => _SaveMeState();
}

class _SaveMeState extends State<SaveMe> {
  Widget _homeWidget = SaveMeSettings();
  Map<Permission, PermissionStatus> statusOf;

  void getUserLocale() {
    String languageCode = Platform.localeName.split('_')[1];
    print("Language code is $languageCode");
    switch (languageCode) {
      case 'UA':
        language = UkranianLanguage();
        break;

      case 'DE':
        language = GermanLanguage();
        break;

      case 'RU':
        language = RussianLanguage();
        break;

      default:
        language = EnglishLanguage();
        break;
    }
  }

  Future _getPermissionsIfAny() async {
    statusOf = await [
      Permission.storage,
      Permission.contacts,
    ].request();
  }

  Future _loadFiles() async {
    if (statusOf[Permission.storage].isGranted) {
      if (await readNumbersFromFileSystemIfAny) {
        print("Access was granted and files loaded.");
        setState(() {
          if (atLeastOneNumberExist) _homeWidget = SaveMeHome();
        });
      } else
        setState(() {
          updateListOnFileSystem;
        });
      if (await storage.read(fromFile: timerSettingSaveFileName) == null)
        setState(() {
          callTimer.updateTimerSettingOnFileSystem;
        });
    } else {
      print("Access to filesystem denied for some reason.");
      setState(() {
        _homeWidget = SaveMeErrorMessage(
          language.loadFilesAccessErrorText,
          "$timerSettingSaveFileName $numbersListSaveFileName",
        );
      });
    }
  }

  Future _checkContactListPermissionStatus() async {
    if (statusOf[Permission.contacts].isGranted) {
      print("Access to contacts was granted.");
    } else {
      print("Access to contacts was not granted.");
    }
  }

  Future asyncInitPart() async {
    await _getPermissionsIfAny();
    await _loadFiles();
    await _checkContactListPermissionStatus();
  }

  @override
  void initState() {
    asyncInitPart();
    getUserLocale();
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
