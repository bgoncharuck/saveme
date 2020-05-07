import 'package:flutter/material.dart';
import 'package:saveme/widgets/navigation_button.dart';
import 'package:saveme/modules/numbers_list.dart';
import 'package:saveme/widgets/add_number_form.dart';

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
                child: AddNumberForm(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
