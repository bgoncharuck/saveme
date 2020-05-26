import 'package:flutter/material.dart';
import 'package:saveme/constants.dart';
import 'package:saveme/screens/first_start_number.dart';
import 'package:saveme/screens/home.dart';
import 'package:saveme/screens/settings.dart';
import 'package:saveme/screens/numbers.dart';
import 'package:saveme/screens/numbers_add.dart';

final defaultRoute = <String, WidgetBuilder>{
  '/home': (BuildContext context) => SaveMeHome(),
  '/settings': (BuildContext context) => SaveMeSettings(),
  '/numbers': (BuildContext context) => SaveMeNumbers(),
  '/numbers/add': (BuildContext context) => SaveMeNumbersAdd(),
};
Future<Widget> get chooseHomeScreenForDefaultRoute async {
  // check if timer setting available from filesystem
  bool isNotNull = true;
  try {
    isNotNull = await callTimer.readTimerSettingFromFileSystem;
  } catch (fileNotExistError) {} finally {
    if (!isNotNull) callTimer.updateTimerSettingOnFileSystem;
  }
  // check if numbers list available from filesystem
  try {
    if (await numbers.readFromFileSystemIfAny) {
      print("DefaultRouteSetup: Completed.");
      if (numbers.atLeastOneNumberExist) return SaveMeHome();
    }
  } catch (fileNotExistError) {} finally {
    numbers.updateOnFileSystem;
  }
  // if not available or empty, then
  print("Warning - DefaultRouteSetup: Need at least one number.");
  return SaveMeSettings();
}

final firstStartRoute = <String, WidgetBuilder>{};
Future<Widget> get HomeScreenForFirstRoute async {
  return FirstStartNumberPicker();
}
