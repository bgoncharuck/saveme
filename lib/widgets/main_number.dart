import 'package:flutter/material.dart';
import 'package:saveme/models/number.dart';
import 'package:saveme/modules/numbers_list.dart';
import 'package:saveme/models/number.dart';
import 'package:saveme/style/themes.dart';

class MainNumber extends StatefulWidget {
  @override
  _MainNumberState createState() => _MainNumberState();
}

class _MainNumberState extends State<MainNumber> {
  if (Numbrs.isNotEmpty && )
  String editedNumber;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(18.0),
        ),
        padding: EdgeInsets.all(1.0),
        onPressed: () {
          setState(() {
            Navigator.of(context).pushNamed("/numbers/add");
          });
        },
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                top: 1.0,
                bottom: 1.0,
                left: 10.0,
                right: 2.0,
              ),
              child: Icon(
                Icons.smartphone,
                color: Colors.black,
                size: 32.0,
              ),
            ),
            Expanded(
              child: TextField(
                keyboardType: TextInputType.phone,
                autofocus: true,
                decoration: InputDecoration(
                  labelText: 'Valid Phone Number',
                  icon: Icon(
                    Icons.import_contacts,
                    color: DefaultTheme.colorScheme.onBackground,
                    size: 28.0,
                  ),
                ),
                onChanged: (String changed) {
                  editedNumber = changed;
                },
                onEditingComplete: () {
                  if (editedNumber != null) {
                    if (Numbers.isNotEmpty)
                    Numbers.firstWhere((INumber number) {
                      if (number.isMainNumber) return true;
                      return false;
                    }, orElse: () => NoNumber).text= editedNumber;
                    else Numbers.add(
                        Number(editedNumber, isMain: Numbers.isEmpty));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
