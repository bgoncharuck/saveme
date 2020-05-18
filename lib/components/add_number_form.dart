import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saveme/constants.dart';
import 'package:saveme/components/numbers_list.dart';
import 'package:saveme/models/number.dart';
import 'package:saveme/modules/contacts_access.dart';

class AddNumberForm extends StatefulWidget {
  @override
  _AddNumberFormState createState() => _AddNumberFormState();
}

class _AddNumberFormState extends State<AddNumberForm> {
  final TextEditingController _editedNumber = TextEditingController();
  final _addNumberFormKey = GlobalKey<FormState>();
  void _numberEditingComplete() {
    if (_addNumberFormKey.currentState.validate()) {
      addNumber(Number(_editedNumber.text, isMain: noNumberSetted));
      Navigator.of(context).pushNamed("/numbers");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _addNumberFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: Text(
              "The number of the person you will calling for a help.",
              style: TextStyle(
                fontSize: 24,
              ),
            ),
          ),
          TextFormField(
            validator: (String number) {
              if (number.isEmpty || number.length < 3) {
                return 'Number must to be valid';
              } else if (numberIsAlreadyAddded(number)) {
                return "You already added this number";
              }
              return null;
            },
            keyboardType: TextInputType.phone,
            autofocus: true,
            decoration: InputDecoration(
              icon: FlatButton(
                child: Icon(
                  Icons.import_contacts,
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
        ],
      ),
    );
  }
}
