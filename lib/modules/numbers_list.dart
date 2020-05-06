import 'package:flutter/material.dart';
import 'package:saveme/style/themes.dart';
import 'package:saveme/models/number.dart';

List<INumber> _numbers = [];

bool get atLeastOneNumberExist => _numbers.isNotEmpty;
bool get noNumberSetted => _numbers.isEmpty;
INumber get mainNumber => _numbers.firstWhere((INumber number) {
      if (number.isMainNumber) return true;
      return false;
    }, orElse: () => NoNumber);
bool numberIsNotAlreadyAddded(String text)=> !_numbers.any((INumber number) {
  if (number.text == text) return true;
  return false;
});
void addNumber(INumber number) => _numbers.add(number);

class NumbersList extends StatefulWidget {
  @override
  _NumbersListState createState() => _NumbersListState();
}

class _NumbersListState extends State<NumbersList> {
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: _numbers.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: new Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        FlatButton(
                          onPressed: () {
                            setState(() {
                              if (_numbers[index].isMainNumber) {
                                _numbers[index].isMainNumber = false;
                              } else {
                                _numbers.firstWhere((INumber number) {
                                  if (number.isMainNumber) return true;
                                  return false;
                                }, orElse: () => NoNumber).isMainNumber = false;

                                _numbers[index].isMainNumber = true;
                              }
                            });
                          },
                          child: Text(_numbers[index].text,
                              style: TextStyle(
                                  fontSize: 24.0,
                                  color: _numbers[index].isMainNumber
                                      ? DefaultTheme.buttonColor
                                      : DefaultTheme.colorScheme.onSurface)),
                        ),
                      ],
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      setState(() {
                        _numbers.removeAt(index);
                      });
                    },
                    child: Icon(
                      Icons.delete,
                      color: DefaultTheme.colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
              Divider(color: DefaultTheme.colorScheme.onSurface),
            ],
          ),
        );
      },
    );
  }
}
