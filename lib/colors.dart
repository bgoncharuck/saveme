import 'package:flutter/material.dart';

abstract class FromTheme {
  Color get darkPrimary;
  Color get defaultPrimary;
  Color get lightPrimary;
  Color get textPrimary;
  Color get accent;
  Color get primaryText;
  Color get secondaryText;
  Color get divider;
  Color get background;
  Color get phoneBackground;
}

class GreenRedMaterial implements FromTheme {
  @override
  Color get darkPrimary => Colors.green;
  @override
  Color get defaultPrimary => Colors.green;
  @override
  Color get lightPrimary => Colors.lightGreen;
  @override
  Color get textPrimary => Colors.white;
  @override
  Color get accent => Colors.redAccent;
  @override
  Color get primaryText => Colors.black;
  @override
  Color get secondaryText => Colors.grey[500];
  @override
  Color get divider => Colors.grey;
  @override
  Color get background => Colors.grey[300];
  @override
  Color get phoneBackground => Colors.white;
}

FromTheme ColorTheme = GreenRedMaterial();
