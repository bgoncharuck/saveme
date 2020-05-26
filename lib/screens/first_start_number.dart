import 'package:flutter/material.dart';
import 'package:saveme/components/contact_number_input.dart';
import 'package:saveme/constants.dart';
import 'package:saveme/models/number.dart';

class FirstStartNumberPicker extends StatefulWidget {
  @override
  _FirstStartNumberPickerState createState() => _FirstStartNumberPickerState();
}

class _FirstStartNumberPickerState extends State<FirstStartNumberPicker> {
  bool numberAdded = numbers.mainNumber.text != "";
  Future<void> pickFromContacts() async {
    final contact = await contacts.choose();
    if (contact != null) {
      numbers.addNumber(Number(contact.phoneNumber.number,
          isMain: numbers.noNumberSetted, contactName: contact.fullName));
      numberAdded = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 32),
              child: Text(
                language.addTheNumberDescription,
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            (numberAdded)
                ? ContactNumberInputForm(
                    onEditingComplete: () {},
                    icon: Icons.contacts,
                    isEditable: true,
                    autofocus: false,
                  )
                : Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: FloatingActionButton(
                          heroTag: "firstStartNumberContactPick",
                          child: Icon(
                            Icons.contacts,
                            color: defaultTheme.onMainColor,
                            size: 28.0,
                          ),
                          onPressed: () {
                            pickFromContacts();
                            setState(() {});
                          },
                        ),
                      ),
                      Text(numbers.mainNumber.text),
                    ],
                  ),
            (numberAdded)
                ? FloatingActionButton(
                    heroTag: "firstStartNumberDone",
                    child: Icon(
                      Icons.done,
                      color: defaultTheme.onMainColor,
                      size: 28.0,
                    ),
                    onPressed: () {
                      setState(() {});
                    },
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
