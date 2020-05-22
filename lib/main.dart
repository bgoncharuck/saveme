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
import 'package:saveme/routes/default.dart';

void main() => runApp(SaveMe());

class SaveMe extends StatefulWidget {
  @override
  _SaveMeState createState() => _SaveMeState();
}

class _SaveMeState extends State<SaveMe> {
  Widget routeToUse =
      MaterialApp(theme: saveMeLight, title: 'SaveMe', home: LoadingScreen());
  Map<Permission, PermissionStatus> statusOf;
  //
  //
  Future<void> get requestPermissions async => statusOf = await [
        Permission.phone,
        Permission.storage,
        Permission.contacts,
      ].request();
  Future<bool> get isFirstStart async => false;
  Future<Widget> get chooseYourError async {
    //
    if (statusOf[Permission.phone].isGranted == false) {
      print(
          "Init 0 - ERROR - PermissionsCheck: Phone call access was not granted.");
      return SaveMeErrorMessage(
        language.noCallingPermissionError,
        "",
      );
    }
    print("Init 0 - PermissionsCheck: Phone call access was granted.");
    //
    if (statusOf[Permission.storage].isGranted == false) {
      print(
          "Init 0 - ERROR - PermissionsCheck: Storage access was not granted.");
      return SaveMeErrorMessage(
        language.loadFilesAccessErrorText,
        "$timerSettingSaveFileName $numbersListSaveFileName",
      );
    }
    print("Init 0 - PermissionsCheck: Storage access was granted.");
    //
    if (statusOf[Permission.contacts].isGranted)
      print("Init 0 - PermissionsCheck: Contacts access was granted.");
    //
    return null;
  }

  //
  //
  Future<void> asyncInitPart() async {
    await requestPermissions;
    Widget errors = await chooseYourError;
    if (errors == null) {
      return;
    }
    // if any error
    setState(() {
      routeToUse =
          MaterialApp(theme: saveMeLight, title: 'SaveMe', home: errors);
    });
  }

  //
  //
  @override
  void initState() {
    asyncInitPart();
    super.initState();
  }

  Widget build(BuildContext context) => routeToUse;
}
