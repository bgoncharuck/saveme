import 'package:flutter/material.dart';
import 'package:saveme/models/number.dart';
import 'package:saveme/constants.dart';

class ContactNumberInputForm extends StatefulWidget {
  final Function onEditingComplete;
  final IconData icon;
  final bool isEditable;
  final bool autofocus;
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
    if (widget.isEditable) _editedNumberController.text = numbers.mainNumber.text;
    super.initState();
  }

  void _addNumber() =>
      numbers.addNumber(Number(_editedNumberController.text, isMain: numbers.noNumberSetted));

  void _numberEditingComplete() {
    if (_numberFormKey.currentState.validate()) {
      if (widget.isEditable) {
        if (numbers.atLeastOneNumberExist) {
          numbers.mainNumber.text = _editedNumberController.text;
          numbers.updateOnFileSystem;
        } else
          _addNumber();

        _editedNumberController.text = numbers.mainNumber.text;
      } else {
        _addNumber();
      }

      widget.onEditingComplete();
    }
  }

  Future get _editedByContactsPick async {
    _contactWasPicked =
        await contacts.getNumber(_editedNumberController);

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
                  return language.numberMustBeValid;
                } else if (!widget.isEditable &&
                    numbers.numberIsAlreadyAddded(number)) {
                  return language.numberMustBeValid;
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
