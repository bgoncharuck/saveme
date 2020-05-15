import 'package:flutter/material.dart';

abstract class IDefaultTheme {
  Color background;
  Color onBackground;
  Color mainColor;
  Color onMainColor;
  Color label;
  Color accent;
}

class GreenGreyTheme implements IDefaultTheme {
  Color background = Colors.grey[100];
  Color onBackground = Colors.black;
  Color mainColor = Colors.green;
  Color onMainColor = Colors.white;
  Color label = Colors.grey[500];
  Color accent = Colors.red;
}

final IDefaultTheme defaultTheme = GreenGreyTheme();

final ThemeData saveMeLight = ThemeData(
  colorScheme: ColorScheme(
    background: defaultTheme.background,
    onBackground: defaultTheme.onBackground,
    brightness: Brightness.light,
    primary: defaultTheme.mainColor,
    primaryVariant: defaultTheme.mainColor,
    onPrimary: defaultTheme.onMainColor,
    secondary: defaultTheme.mainColor,
    secondaryVariant: defaultTheme.mainColor,
    onSecondary: defaultTheme.onMainColor,
    surface: defaultTheme.background,
    onSurface: defaultTheme.onBackground,
    error: Colors.red,
    onError: Colors.yellow,
  ),
  hintColor: defaultTheme.onBackground,
  cursorColor: defaultTheme.mainColor,
  focusColor: defaultTheme.mainColor,
  accentColor: defaultTheme.mainColor,
  accentColorBrightness: Brightness.dark,
  accentIconTheme: IconThemeData(
    color: defaultTheme.onMainColor,
  ),
  buttonColor: defaultTheme.mainColor,
  buttonTheme: ButtonThemeData(
    textTheme: ButtonTextTheme.primary,
  ),
  scaffoldBackgroundColor: defaultTheme.background,
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
    enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: defaultTheme.onBackground)),
    focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: defaultTheme.mainColor)),
    errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: defaultTheme.accent)),
    focusedErrorBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: defaultTheme.accent)),
    labelStyle: TextStyle(color: defaultTheme.label),
    focusColor: defaultTheme.mainColor,
  ),
);
