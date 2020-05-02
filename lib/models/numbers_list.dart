import 'package:flutter/material.dart';
import 'package:saveme/widgets/number_decoration.dart';
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
  void choise({int index = 0});
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

  int _mainNumberIndex;
  @override
  List<INumberDecoration> _numbers = [];
  @override
  bool add(INumber number) {
    if (_debugListContains(number))
      return false;
    else {
      _numbers.add(NumbersListDecoration(number));
      return true;
    }
  }

  @override
  bool remove(INumber number) {
    if (_debugListContains(number)) {
      _numbers.removeAt(_debugListIndexOf(number));
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
  void choise({int index = 0}) {
    if (oneNumber())
      _mainNumberIndex = 0;
    else
      _mainNumberIndex = index;
  }

  @override
  INumber get mainNumber => _numbers[_mainNumberIndex].inDecoration;
}

class _INumbersListState extends State<INumbersList> {
  @override
  Widget build(BuildContext context) {
    return Column(children: widget._numbers);
  }
}

INumbersList NumbersList = DefaultNumbersList();
