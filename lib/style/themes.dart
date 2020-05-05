import 'package:flutter/material.dart';

final ThemeData DefaultTheme = GreenGreyTheme;

ThemeData GreenGreyTheme = ThemeData(
  colorScheme: ColorScheme(
    background: Colors.grey[100],
    onBackground: Colors.black,
    brightness: Brightness.light,
    primary: Colors.green,
    primaryVariant: Colors.green,
    onPrimary: Colors.white,
    secondary: Colors.green,
    secondaryVariant: Colors.green,
    onSecondary: Colors.white,
    surface: Colors.grey[100],
    onSurface: Colors.black,
    error: Colors.red,
    onError: Colors.yellow,
  ),
  hintColor: Colors.black,
  cursorColor: Colors.green,
  focusColor: Colors.green,
  accentColor: Colors.green,
  accentColorBrightness: Brightness.dark,
  accentIconTheme: IconThemeData(
    color: Colors.white,
  ),
  buttonColor: Colors.green,
  buttonTheme: ButtonThemeData(
    textTheme: ButtonTextTheme.primary,
  ),
  scaffoldBackgroundColor: Colors.grey[100],
  sliderTheme: SliderThemeData(
    thumbShape: RoundSliderThumbShape(
      disabledThumbRadius: 8.0,
      enabledThumbRadius: 8.0,
    ),
    trackHeight: 8.0,
  ),
  inputDecorationTheme: InputDecorationTheme(
    disabledBorder:
        UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey[500])),
    enabledBorder:
        UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
    focusedBorder:
        UnderlineInputBorder(borderSide: BorderSide(color: Colors.green)),
    errorBorder:
        UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
    focusedErrorBorder:
        UnderlineInputBorder(borderSide: BorderSide(color: Colors.redAccent)),
    labelStyle: TextStyle(color: Colors.grey[500]),
    focusColor: Colors.green,
  ),
);
