import 'package:flutter/material.dart';
import 'package:saveme/models/number.dart';
import 'package:saveme/components/numbers_list.dart';
import 'package:saveme/constants.dart';
import 'package:saveme/modules/contacts_access.dart';

class MainNumber extends StatefulWidget {
  @override
  _MainNumberState createState() => _MainNumberState();
}

class _MainNumberState extends State<MainNumber> {
  final TextEditingController _editedNumber = TextEditingController();
  final _mainNumberFormKey = GlobalKey<FormState>();
  void _numberEditingComplete() {
    if (_mainNumberFormKey.currentState.validate()) {
      if (atLeastOneNumberExist) {
        mainNumber.text = _editedNumber.text;
        updateListOnFileSystem;
      } else
        addNumber(Number(_editedNumber.text, isMain: noNumberSetted));

      _editedNumber.text = mainNumber.text;
    }
    FocusScope.of(context).unfocus();
  }

  _MainNumberState() {
    _editedNumber.text = mainNumber.text;
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16, left: 16),
      child: Form(
        key: _mainNumberFormKey,
        child: TextFormField(
          validator: (String number) {
            if (number.isEmpty || number.length < 3) {
              return 'Number must to be valid';
            }
            return null;
          },
          keyboardType: TextInputType.phone,
          autofocus: false,
          decoration: InputDecoration(
            labelText: "Main Phone Number To Call",
            icon: FlatButton(
              child: Icon(
                Icons.smartphone,
                color: defaultTheme.onBackground,
                size: 28.0,
              ),
              onPressed: () {
                setState(() {
                  getNumberFromContactsList(_editedNumber);
                  _numberEditingComplete();
                });
              },
            ),
          ),
          controller: _editedNumber,
          onEditingComplete: () {
            _numberEditingComplete();
          },
        ),
      ),
    );
  }
}
