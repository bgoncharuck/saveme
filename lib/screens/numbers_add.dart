import 'package:flutter/material.dart';
import 'package:saveme/components/contact_number_input.dart';
import 'package:saveme/components/navigation_button.dart';
import 'package:saveme/constants.dart';

class SaveMeNumbersAdd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            (numbers.atLeastOneNumberExist)
                // User need to have at least one number, to see navigation
                ? Row(
                    children: <Widget>[
                      NavigationButton(
                        navigate: "/numbers",
                        name: language.numbersNavigationButton,
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
                        language.addTheNumberDescription,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    ContactNumberInputForm(
                      onEditingComplete: () {
                        Navigator.of(context).pushNamed("/numbers");
                      },
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
