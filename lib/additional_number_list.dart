import 'package:flutter/material.dart';
import 'colors.dart';
import 'navigation_button.dart';

class SaveMeNumberList extends StatefulWidget {
  @override
  _SaveMeNumberListState createState() => _SaveMeNumberListState();
}

class _SaveMeNumberListState extends State<SaveMeNumberList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.background,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                NavigationButton(
                    navigate: "/settings",
                    name: "Settings",
                    icon: Icons.arrow_back,
                    backgroundColor: ColorTheme.darkPrimary,
                    color: ColorTheme.textPrimary),
                Expanded(
                  child: SizedBox(),
                ),
              ],
            ),
            Expanded(
              child: Center(
                child: Text("Numbers"),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            Navigator.of(context).pushNamed("/settings/numbers/add");
          });
        },
        backgroundColor: ColorTheme.defaultPrimary,
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
