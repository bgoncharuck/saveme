import 'package:flutter/material.dart';

abstract class INumber {
  String _text;
  String get text;
}

class Number implements INumber {
  String _text;
  Number(this._text);
  @override
  String get text => _text;
}
