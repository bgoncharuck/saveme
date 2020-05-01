import 'package:flutter/material.dart';
import 'package:saveme/style/themes.dart';
import 'package:saveme/models/number.dart';

abstract class INumbersList extends StatefulWidget {
  List<Widget> _numbers;
  @override
  _INumbersListState createState() => _INumbersListState();
  bool add(Widget number);
  bool remove(Widget number);
}

class DefaultNumbersList extends INumbersList {
  @override
  List<Widget> _numbers = [Divider(color: DefaultTheme.colorScheme.onSurface)];
  @override
  bool add(Widget number) {
    if (_numbers.contains(number))
      return false;
    else {
      _numbers.add(number);
      return true;
    }
  }

  @override
  bool remove(Widget number) => _numbers.remove(number);
}

class _INumbersListState extends State<INumbersList> {
  @override
  Widget build(BuildContext context) {
    return Column(children: widget._numbers);
  }
}

INumbersList NumbersList = DefaultNumbersList();
