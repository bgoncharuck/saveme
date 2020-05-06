import 'package:flutter/material.dart';
import 'package:saveme/style/themes.dart';
import 'package:saveme/widgets/navigation_button.dart';
import 'package:saveme/modules/numbers_list.dart';
import 'package:saveme/models/number.dart';

class SaveMeNumbersAdd extends StatefulWidget {
  @override
  _SaveMeNumbersAddState createState() => _SaveMeNumbersAddState();
}

class _SaveMeNumbersAddState extends State<SaveMeNumbersAdd> {
  String editedNumber;
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
                    TextField(
                      keyboardType: TextInputType.phone,
                      autofocus: true,
                      decoration: InputDecoration(
                        labelText: 'Valid Phone Number',
                        icon: Icon(
                          Icons.import_contacts,
                          color: defaultTheme.onBackground,
                          size: 28.0,
                        ),
                      ),
                      onChanged: (String changed) {
                        editedNumber = changed;
                      },
                      onEditingComplete: () {
                        if (editedNumber != null &&
                            numberIsNotAlreadyAddded(editedNumber)) {
                          addNumber(
                              Number(editedNumber, isMain: noNumberSetted));
                          Navigator.of(context).pushNamed("/numbers");
                        }
                      },
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
