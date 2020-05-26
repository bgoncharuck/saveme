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
  String _contactWasPicked = null;

  @override
  void initState() {
    if (widget.isEditable)
      _editedNumberController.text = numbers.mainNumber.text;
    super.initState();
  }

  void _addNumber({String contactName = ""}) =>
      numbers.addNumber(Number(_editedNumberController.text,
          isMain: numbers.noNumberSetted, contactName: contactName));

  void _numberEditingComplete() {
    if (_numberFormKey.currentState.validate()) {
      if (widget.isEditable) {
        if (numbers.atLeastOneNumberExist) {
          numbers.mainNumber.text =
              _editedNumberController.text.replaceAll(RegExp(r"\s\b|\b\s"), "");
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
    _contactWasPicked = await contacts.getContact(_editedNumberController);

    if (_contactWasPicked != null) {
      if (numbers.noNumberSetted)
        _addNumber(contactName: _contactWasPicked);
      else {
        numbers.mainNumber.isMainNumber = false;
        numbers.addNumber(Number(_editedNumberController.text,
            isMain: true, contactName: _contactWasPicked));
      }
      _contactWasPicked = null;
      widget.onEditingComplete();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: FloatingActionButton(
            child: Icon(
              widget.icon,
              color: defaultTheme.onMainColor,
              size: 28.0,
            ),
            onPressed: () {
              setState(() {
                _editedByContactsPick;
              });
            },
          ),
        ),
        Flexible(
          child: Form(
            key: _numberFormKey,
            child: TextFormField(
              controller: _editedNumberController,
              validator: (String number) {
                if (number.isEmpty || number.length < 3 || number.length > 22) {
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
                    (widget.isEditable) ? language.mainNumberEditingLabel : "",
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
