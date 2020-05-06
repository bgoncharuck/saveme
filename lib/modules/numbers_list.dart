import 'package:flutter/material.dart';
import 'package:saveme/style/themes.dart';
import 'package:saveme/models/number.dart';
import 'package:saveme/widgets/main_number.dart';

List<INumber> Numbers = [];

bool get AtLeastOneNumberExist => Numbers.isEmpty;
bool get NoNumberSetted => Numbers.isNotEmpty;
INumber get MainNumber => Numbers[0];
void AddNumber(INumber number) => Numbers.add(number);

class NumbersList extends StatefulWidget {
  @override
  _NumbersListState createState() => _NumbersListState();
}

class _NumbersListState extends State<NumbersList> {
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: Numbers.length,
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
                              if (Numbers[index].isMainNumber) {
                                Numbers[index].isMainNumber = false;
                              } else {
                                Numbers.firstWhere((INumber number) {
                                  if (number.isMainNumber) return true;
                                  return false;
                                }, orElse: () => NoNumber).isMainNumber = false;

                                Numbers[index].isMainNumber = true;
                              }
                            });
                          },
                          child: Text(Numbers[index].text,
                              style: TextStyle(
                                  fontSize: 24.0,
                                  color: Numbers[index].isMainNumber
                                      ? DefaultTheme.buttonColor
                                      : DefaultTheme.colorScheme.onSurface)),
                        ),
                      ],
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      setState(() {
                        Numbers.removeAt(index);
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
