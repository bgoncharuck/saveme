import 'package:flutter/material.dart';
import 'package:saveme/components/contact_number_input.dart';
import 'package:saveme/components/numbers_list.dart';
import 'package:saveme/components/navigation_button.dart';

class SaveMeNumbersAdd extends StatefulWidget {
  @override
  _SaveMeNumbersAddState createState() => _SaveMeNumbersAddState();
}

class _SaveMeNumbersAddState extends State<SaveMeNumbersAdd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            (atLeastOneNumberExist)
                // User need to have at least one number, to see navigation
                ? Row(
                    children: <Widget>[
                      NavigationButton(
                        navigate: "/numbers",
                        name: "Numbers To Call",
                        icon: Icons.arrow_back,
                      ),
                      Expanded(
                        child: SizedBox(),
                      ),
                    ],
                  )
                : Container(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(32),
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
                    ContactNumberInputForm(
                      onEditingComplete: () {
                        Navigator.of(context).pushNamed("/numbers");
                      },
                      icon: Icons.import_contacts,
                      isEditable: false,
                      autofocus: true,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
