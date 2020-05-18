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
  FocusNode numberInputFocus;
  bool _contactWasPicked = false;
  void _numberEditingComplete() {
    if (_mainNumberFormKey.currentState.validate()) {
      if (atLeastOneNumberExist) {
        mainNumber.text = _editedNumber.text;
        updateListOnFileSystem;
      } else
        addNumber(Number(_editedNumber.text, isMain: noNumberSetted));

      _editedNumber.text = mainNumber.text;
    }
  }

  Future get _editedByContactsPick async {
    _contactWasPicked = await getNumberFromContactsList(_editedNumber);
    if (_contactWasPicked) {
      _numberEditingComplete();
      _contactWasPicked = false;
    }
  }

  @override
  void initState() {
    _editedNumber.text = mainNumber.text;
    numberInputFocus = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16, left: 16),
      child: Row(
        children: <Widget>[
          FlatButton(
            child: Icon(
              Icons.smartphone,
              color: defaultTheme.onBackground,
              size: 28.0,
            ),
            onPressed: () {
              setState(() {
                _editedByContactsPick;
              });
            },
          ),
          Flexible(
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
                focusNode: numberInputFocus,
                autofocus: false,
                decoration: InputDecoration(
                  labelText: "Main Phone Number To Call",
                ),
                controller: _editedNumber,
                onEditingComplete: () {
                  _numberEditingComplete();
                  numberInputFocus.unfocus();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
