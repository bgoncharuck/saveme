import 'package:flutter/material.dart';
import 'package:saveme/modules/numbers_list.dart';
import 'package:saveme/style/themes.dart';
import 'package:saveme/models/number.dart';

class INumberDecoration extends StatelessWidget {
  final INumber inDecoration;
  final StatefulWidget _decoration;
  INumberDecoration._decorate(this.inDecoration, this._decoration);
  @override
  Widget build(BuildContext context) {
    return _decoration;
  }
}

class _NumbersListDecoration extends StatefulWidget {
  final INumber number;
  _NumbersListDecoration(this.number);
  @override
  __NumbersListDecorationState createState() => __NumbersListDecorationState();
}

class __NumbersListDecorationState extends State<_NumbersListDecoration> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
                        if (NumbersList.isMainNumber(widget.number)) {
                          NumbersList.unsetMainNumber();
                        } else {
                          NumbersList.mainNumber = widget.number;
                        }
                        Navigator.of(context).pushNamed("/numbers");
                      });
                    },
                    child: Text(widget.number.text,
                        style: TextStyle(
                            fontSize: 24.0,
                            color: NumbersList.isMainNumber(widget.number)
                                ? DefaultTheme.buttonColor
                                : DefaultTheme.colorScheme.onSurface)),
                  ),
                ],
              ),
            ),
            FlatButton(
              onPressed: () {
                setState(() {
                  if (NumbersList.remove(widget.number)) {
                    print("Number ${widget.number.text} was removed");
                    Navigator.of(context).pushNamed("/numbers");
                  } else
                    print("Error: Number ${widget.number.text} was not found");
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
    );
  }
}

class NumbersListDecoration extends INumberDecoration {
  final INumber inDecoration;
  NumbersListDecoration(this.inDecoration)
      : super._decorate(
          inDecoration,
          _NumbersListDecoration(inDecoration),
        );
}
