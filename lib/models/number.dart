import 'package:flutter/material.dart';

abstract class INumber {
  String text;
  bool isMainNumber;
}

class Number implements INumber {
  bool isMainNumber;
  String text;
  Number(this.text, {bool isMain = false}) {
    isMainNumber = isMain;
  }
}

final INumber NoNumber = Number("");
final INumber DebugNumber = Number("DebugNumber");
