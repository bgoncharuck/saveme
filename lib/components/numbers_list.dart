import 'package:flutter/material.dart';
import 'package:saveme/constants.dart';
import 'package:saveme/models/number.dart';
import 'package:saveme/screens/numbers.dart';

class NumbersList extends StatefulWidget {
  @override
  _NumbersListState createState() => _NumbersListState();
}

class _NumbersListState extends State<NumbersList> {
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: numbers.numbers.length,
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
                              if (numbers.numbers[index].isMainNumber) {
                                numbers.numbers[index].isMainNumber = false;
                              } else {
                                numbers.numbers.firstWhere((INumber number) {
                                  if (number.isMainNumber) return true;
                                  return false;
                                }, orElse: () => noNumber).isMainNumber = false;

                                numbers.numbers[index].isMainNumber = true;
                              }

                              numbers.updateOnFileSystem;
                            });
                          },
                          child: Text(numbers.numbers[index].text,
                              style: TextStyle(
                                  fontSize: 24.0,
                                  color: numbers.numbers[index].isMainNumber
                                      ? defaultTheme.mainColor
                                      : defaultTheme.onBackground)),
                        ),
                      ],
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      setState(() {
                        numbers.numbers.removeAt(index);
                        numbers.updateOnFileSystem;
                        if (numbers.numbers.isEmpty) {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              '/numbers', (Route<dynamic> route) => false);
                          Navigator.of(context).pushNamed("/numbers/add");
                        }
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
