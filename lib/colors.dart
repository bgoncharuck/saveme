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
}

class GreenRedMaterial implements FromTheme {
  @override
  Color get darkPrimary => Colors.green;
  @override
  Color get defaultPrimary => Colors.lightGreen;
  @override
  Color get lightPrimary => Colors.lightGreenAccent;
  @override
  Color get textPrimary => Colors.white;
  @override
  Color get accent => Colors.redAccent;
  @override
  Color get primaryText => Colors.white;
  @override
  Color get secondaryText => Colors.white70;
  @override
  Color get divider => Colors.grey;
  @override
  Color get background => Colors.black87;
}

FromTheme ColorTheme = GreenRedMaterial();
