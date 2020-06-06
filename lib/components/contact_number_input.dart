import 'package:flutter/material.dart';
import 'package:saveme/models/number.dart';
import 'package:saveme/constants.dart';

class ContactNumberInputForm extends StatefulWidget {
  final Function onEditingComplete;
  final bool isEditable;
  final bool autofocus;
  ContactNumberInputForm(
      {@required this.onEditingComplete,
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
          isMain: numbers.noNumberSetted || widget.isEditable,
          contactName: contactName));

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
      _addNumber(contactName: _contactWasPicked);
      _contactWasPicked = null;
      widget.onEditingComplete();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: <Widget>[
              FloatingActionButton(
                mini: true,
                child: Icon(
                  Icons.contacts,
                  color: defaultTheme.onMainColor,
                  size: 26.0,
                  semanticLabel: "from the contacts",
                ),
                onPressed: () {
                  setState(() {
                    _editedByContactsPick;
                  });
                },
              ),
              Text(
                language.fromContacts,
                style: TextStyle(
                  color: defaultTheme.mainColor,
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
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
                  return language.numberAlreadyAdded;
                }
                return null;
              },
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText:
                    (widget.isEditable) ? language.mainPhoneNumberLabel : "",
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
