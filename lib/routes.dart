import 'package:flutter/material.dart';
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
