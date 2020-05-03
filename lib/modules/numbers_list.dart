import 'package:flutter/material.dart';
import 'package:saveme/modules/number_decoration.dart';
import 'package:saveme/models/number.dart';

abstract class INumbersList extends StatefulWidget {
  List<INumberDecoration> _numbers;
  @override
  _INumbersListState createState() => _INumbersListState();
  bool add(INumber number);
  bool remove(INumber number);
  bool isEmpty();
  bool isNotEmpty();
  bool oneNumber();
  INumber get mainNumber;
}

class DefaultNumbersList extends INumbersList {
  int _debugListIndexOf(INumber number) =>
      _numbers.indexWhere((INumberDecoration decor) {
        if (decor.inDecoration.text == number.text) return true;
        return false;
      });

  bool _debugListContains(INumber number) =>
      _numbers.any((INumberDecoration decor) {
        if (decor.inDecoration.text == number.text) return true;
        return false;
      });

  int _mainNumberIndex = -1;
  @override
  List<INumberDecoration> _numbers = [];
  @override
  bool add(INumber number) {
    if (_debugListContains(number))
      return false;
    else {
      if (_numbers.length == 0) {
        _mainNumberIndex = 0;
        number.isMainNumber = true;
      }
      _numbers.add(NumbersListDecoration(number));
    }
    return true;
  }

  @override
  bool remove(INumber number) {
    if (_debugListContains(number)) {
      int index = _debugListIndexOf(number);
      if (_numbers[index].inDecoration.isMainNumber) _mainNumberIndex = 0;

      _numbers.removeAt(index);

      if (_numbers.isEmpty) _mainNumberIndex = -1;
      return true;
    }
    return false;
  }

  @override
  bool isEmpty() => _numbers.isEmpty;

  @override
  bool isNotEmpty() => _numbers.isNotEmpty;

  @override
  bool oneNumber() => _numbers.length == 1;

  @override
  INumber get mainNumber {
    if (_mainNumberIndex != -1) return _numbers[_mainNumberIndex].inDecoration;
    return NoNumber;
  }
}

class _INumbersListState extends State<INumbersList> {
  @override
  Widget build(BuildContext context) {
    return Column(children: widget._numbers);
  }
}

final INumbersList NumbersList = DefaultNumbersList();
