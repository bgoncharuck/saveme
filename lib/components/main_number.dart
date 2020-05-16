import 'package:flutter/material.dart';
import 'package:saveme/models/number.dart';
import 'package:saveme/modules/numbers_list.dart';
import 'package:saveme/constants.dart';

class MainNumber extends StatefulWidget {
  @override
  _MainNumberState createState() => _MainNumberState();
}

class _MainNumberState extends State<MainNumber> {
  final TextEditingController _editedNumber = TextEditingController();
  final _mainNumberFormKey = GlobalKey<FormState>();
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
            icon: Icon(
              Icons.smartphone,
              color: defaultTheme.onBackground,
              size: 28.0,
            ),
          ),
          controller: _editedNumber,
          onEditingComplete: () {
            if (_mainNumberFormKey.currentState.validate()) {
              if (atLeastOneNumberExist) {
                mainNumber.text = _editedNumber.text;
                updateListOnFileSystem;
              } else
                addNumber(Number(_editedNumber.text, isMain: noNumberSetted));

              _editedNumber.text = mainNumber.text;
            }
            FocusScope.of(context).unfocus();
          },
        ),
      ),
    );
  }
}
