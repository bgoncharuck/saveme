import 'package:flutter/material.dart';

abstract class INumber {
  String text;
  bool isMainNumber;
}

class Number implements INumber {
  String text;
  bool isMainNumber = false;
  Number(this.text);
}

final INumber NoNumber = Number("No Number");
final INumber DebugNumber = Number("DebugNumber");
