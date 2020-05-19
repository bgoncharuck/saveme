import 'package:flutter/material.dart';
import 'package:saveme/constants.dart';
import 'package:saveme/models/number.dart';


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
