import 'package:flutter/material.dart';
import 'package:saveme/constants.dart';
import 'package:saveme/theme/style.dart';
import 'package:saveme/screens/home.dart';
import 'package:saveme/screens/settings.dart';
import 'package:saveme/screens/numbers.dart';
import 'package:saveme/screens/numbers_add.dart';
import 'package:saveme/screens/loading.dart';
import 'package:saveme/screens/error_message.dart';

final defaultRoute = <String, WidgetBuilder>{
  '/home': (BuildContext context) => SaveMeHome(),
  '/settings': (BuildContext context) => SaveMeSettings(),
  '/numbers': (BuildContext context) => SaveMeNumbers(),
  '/numbers/add': (BuildContext context) => SaveMeNumbersAdd(),
};

class AppError extends StatelessWidget {
  final String desc;
  final String detail;
  AppError(this.desc, this.detail);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Saveme Wrong Permissions',
      theme: saveMeLight,
      home: SaveMeErrorMessage(desc, detail),
    );
  }
}

class AppLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Loading Saveme Cal Timer',
        theme: saveMeLight,
        home: LoadingScreen(),
      );
}

class AppNormal extends StatelessWidget {
  bool noNumbers;
  AppNormal({@required this.noNumbers});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Saveme Call Timer',
      theme: saveMeLight,
      initialRoute: (noNumbers) ? '/settings' : '/home',
      routes: defaultRoute,
    );
  }
}
