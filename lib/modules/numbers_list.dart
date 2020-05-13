import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:saveme/style/themes.dart';
import 'package:saveme/models/number.dart';
import 'package:saveme/modules/storage_access.dart';

final String numbersListSaveFileName = "numbers_list.json";
List<INumber> _numbers = [];

Future<bool> get readNumbersFromFileSystemIfAny async {
  String listOfNumbers = await storage.read(fromFile: numbersListSaveFileName);
  if (listOfNumbers != null) {
    var numbersFromJSON = json.decode(listOfNumbers).toList();
    _numbers = [];
    for (Map<String, dynamic> mappedNumber in numbersFromJSON)
      _numbers.add(Number.fromJson(mappedNumber));
    return true;
  }
  return false;
}

Future<bool> get updateListOnFileSystem async => await storage.write(
    data: json.encode(_numbers), asFile: numbersListSaveFileName);

bool get atLeastOneNumberExist => _numbers.isNotEmpty;
bool get noNumberSetted => _numbers.isEmpty;
INumber get mainNumber => _numbers.firstWhere((INumber number) {
      if (number.isMainNumber) return true;
      return false;
    }, orElse: () => noNumber);
bool numberIsNotAlreadyAddded(String text) => !_numbers.any((INumber number) {
      if (number.text == text) return true;
      return false;
    });
bool numberIsAlreadyAddded(String text) => _numbers.any((INumber number) {
      if (number.text == text) return true;
      return false;
    });
void addNumber(INumber number) {
  _numbers.add(number);
  updateListOnFileSystem;
}

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
                                }, orElse: () => noNumber).isMainNumber = false;

                                _numbers[index].isMainNumber = true;
                              }

                              updateListOnFileSystem;
                            });
                          },
                          child: Text(_numbers[index].text,
                              style: TextStyle(
                                  fontSize: 24.0,
                                  color: _numbers[index].isMainNumber
                                      ? defaultTheme.mainColor
                                      : defaultTheme.onBackground)),
                        ),
                      ],
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      setState(() {
                        _numbers.removeAt(index);
                        updateListOnFileSystem;
                      });
                    },
                    child: Icon(
                      Icons.delete,
                      color: defaultTheme.onBackground,
                    ),
                  ),
                ],
              ),
              Divider(color: defaultTheme.onBackground),
            ],
          ),
        );
      },
    );
  }
}
