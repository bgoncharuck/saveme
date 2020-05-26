import 'package:flutter/material.dart';
import 'package:saveme/constants.dart';
import 'package:saveme/screens/loading.dart';
import 'package:saveme/theme/style.dart';
import 'package:saveme/routes.dart';
import 'package:saveme/components/error_message.dart';
import 'package:permission_handler/permission_handler.dart';

void main() => runApp(SaveMe());

class SaveMe extends StatefulWidget {
  @override
  _SaveMeState createState() => _SaveMeState();
}

class _SaveMeState extends State<SaveMe> {
  Widget homeScreen = LoadingScreen();
  var routeToUse = <String, WidgetBuilder>{};
  Map<Permission, PermissionStatus> statusOf;

  Future<void> get requestPermissions async => statusOf = await [
        Permission.phone,
        Permission.storage,
        Permission.contacts,
      ].request();

  Future<Widget> get chooseYourError async {
    // phone call access
    if (statusOf[Permission.phone].isGranted == false) {
      print("ERROR - PermissionsCheck: Phone call access was not granted.");
      return SaveMeErrorMessage(
        language.noCallingPermissionError,
        "",
      );
    }
    print("PermissionsCheck: Phone call access was granted.");
    // storage access
    if (statusOf[Permission.storage].isGranted == false) {
      print("ERROR - PermissionsCheck: Storage access was not granted.");
      return SaveMeErrorMessage(
        language.loadFilesAccessErrorText,
        "$timerSettingSaveFileName $numbersListSaveFileName",
      );
    }
    print("PermissionsCheck: Storage access was granted.");
    // contacts access, only debug message
    if (statusOf[Permission.contacts].isGranted)
      print("PermissionsCheck: Contacts access was granted.");
    // if all okay
    return null;
  }

  Future<bool> get isFirstStart async {
    String fromFile = await storage.read(fromFile: isFirstStartFileName);
    if (fromFile == null || fromFile != "false") {
      return true;
    }
    return false;
  }

  Future<void> asyncInitPart() async {
    await requestPermissions;
    Widget errors = await chooseYourError;
    if (errors != null) {
      setState(() {
        homeScreen = errors;
      });
      return;
    }
    if (await isFirstStart) {
      print("Route: First Start");
      routeToUse = firstStartRoute;
      homeScreen = await HomeScreenForFirstRoute;
      setState(() {});
      return;
    }
    print("Route: Default");
    routeToUse = defaultRoute;
    homeScreen = await chooseHomeScreenForDefaultRoute;
    setState(() {});
  }

  @override
  void initState() {
    asyncInitPart();
    super.initState();
  }

  Widget build(BuildContext context) => MaterialApp(
        theme: saveMeLight,
        title: 'SaveMe',
        home: homeScreen,
        routes: routeToUse,
      );
}
