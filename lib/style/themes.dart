import 'package:flutter/material.dart';

ThemeData DefaultTheme = GreenGreyTheme;

ThemeData GreenGreyTheme = ThemeData(
  colorScheme: ColorScheme(
    background: Colors.grey[300],
    onBackground: Colors.black,
    brightness: Brightness.light,
    primary: Colors.green,
    primaryVariant: Colors.green,
    onPrimary: Colors.white,
    secondary: Colors.green,
    secondaryVariant: Colors.green,
    onSecondary: Colors.white,
    surface: Colors.grey[200],
    onSurface: Colors.black,
    error: Colors.red,
    onError: Colors.yellow,
  ),
  hintColor: Colors.white,
  accentColor: Colors.green,
  accentColorBrightness: Brightness.dark,
  accentIconTheme: IconThemeData(
    color: Colors.white,
  ),
  buttonColor: Colors.green,
  buttonTheme: ButtonThemeData(
    textTheme: ButtonTextTheme.primary,
  ),
  scaffoldBackgroundColor: Colors.grey[200],
  textTheme: TextTheme(
    button: TextStyle(
      fontFamily: "Georgia",
    ),
  ),
);
