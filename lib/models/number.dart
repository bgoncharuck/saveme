import 'package:flutter/material.dart';

abstract class INumber {
  String text;
}

class Number implements INumber {
  String text;
  Number(this.text);
}

final INumber NoNumber = Number("No Number");
final INumber DebugNumber = Number("DebugNumber");
