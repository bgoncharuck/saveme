import 'package:flutter/material.dart';
import 'package:saveme/widgets/navigation_button.dart';

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
            Row(
              children: <Widget>[
                NavigationButton(
                  navigate: "/numbers",
                  name: "Numbers List",
                  icon: Icons.arrow_back,
                ),
                Expanded(
                  child: SizedBox(),
                ),
              ],
            ),
            Expanded(
              child: Center(
                child: Text("Add Number"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
