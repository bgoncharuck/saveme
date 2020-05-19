import 'package:flutter/material.dart';
import 'package:saveme/models/number.dart';
import 'package:saveme/components/numbers_list.dart';
import 'package:saveme/constants.dart';
import 'package:saveme/modules/contacts_access.dart';

class ContactNumberInputForm extends StatefulWidget {
  Function onEditingComplete;
  IconData icon;
  bool isEditable;
  bool autofocus;
  ContactNumberInputForm(
      {@required this.onEditingComplete,
      @required this.icon,
      @required this.isEditable,
      @required this.autofocus});

  @override
  _ContactNumberInputFormState createState() => _ContactNumberInputFormState();
}

class _ContactNumberInputFormState extends State<ContactNumberInputForm> {
  final TextEditingController _editedNumberController = TextEditingController();
  final _numberFormKey = GlobalKey<FormState>();
  bool _contactWasPicked = false;

  @override
  void initState() {
    if (widget.isEditable) _editedNumberController.text = mainNumber.text;
    super.initState();
  }

  void _addNumber() =>
      addNumber(Number(_editedNumberController.text, isMain: noNumberSetted));

  void _numberEditingComplete() {
    if (_numberFormKey.currentState.validate()) {
      if (widget.isEditable) {
        if (atLeastOneNumberExist) {
          mainNumber.text = _editedNumberController.text;
          updateListOnFileSystem;
        } else
          _addNumber();

        _editedNumberController.text = mainNumber.text;
      } else {
        _addNumber();
      }

      widget.onEditingComplete();
    }
  }

  Future get _editedByContactsPick async {
    _contactWasPicked =
        await getNumberFromContactsList(_editedNumberController);
    if (_contactWasPicked) {
      _numberEditingComplete();
      _contactWasPicked = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        FlatButton(
          child: Icon(
            widget.icon,
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
            key: _numberFormKey,
            child: TextFormField(
              controller: _editedNumberController,
              validator: (String number) {
                if (number.isEmpty || number.length < 3) {
                  return 'Number must to be valid';
                } else if (!widget.isEditable &&
                    numberIsAlreadyAddded(number)) {
                  return "You already added this number";
                }
                return null;
              },
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText:
                    (widget.isEditable) ? "Main Phone Number To Call" : "",
              ),
              autofocus: widget.autofocus,
              onEditingComplete: () {
                _numberEditingComplete();
                if (!widget.autofocus) FocusScope.of(context).unfocus();
              },
            ),
          ),
        ),
      ],
    );
  }
}
