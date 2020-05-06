import 'package:flutter/material.dart';
import 'package:saveme/models/number.dart';
import 'package:saveme/modules/numbers_list.dart';
import 'package:saveme/style/themes.dart';

class MainNumber extends StatefulWidget {
  @override
  _MainNumberState createState() => _MainNumberState();
}

class _MainNumberState extends State<MainNumber> {
  String editedNumber;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16, left: 16),
      child: TextField(
        keyboardType: TextInputType.phone,
        autofocus: false,
        decoration: InputDecoration(
          labelText: "Main Phone Number To Call",
          icon: Icon(
            Icons.smartphone,
            color: DefaultTheme.colorScheme.onBackground,
            size: 28.0,
          ),
        ),
        controller: TextEditingController(
          text: Numbers.firstWhere((INumber number) {
            if (number.isMainNumber) return true;
            return false;
          }, orElse: () => NoNumber).text,
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
              }, orElse: () => NoNumber).text = editedNumber;
            else
              Numbers.add(Number(editedNumber, isMain: Numbers.isEmpty));
          }

          FocusScope.of(context).unfocus();
        },
      ),
    );
  }
}
