import 'package:flutter/material.dart';
import 'package:saveme/style/themes.dart';
import 'package:saveme/widgets/navigation_button.dart';
import 'package:saveme/models/numbers_list.dart';
import 'package:saveme/models/number.dart';

class SaveMeNumbers extends StatefulWidget {
  @override
  _SaveMeNumbersState createState() => _SaveMeNumbersState();
}

class _SaveMeNumbersState extends State<SaveMeNumbers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                NavigationButton(
                  navigate: "/settings",
                  name: "Settings",
                  icon: Icons.arrow_back,
                ),
                Expanded(
                  child: SizedBox(),
                ),
              ],
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  Divider(color: DefaultTheme.colorScheme.onSurface),
                  NumbersList,
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            NumbersList.add(Number("DebugNumber"));
            Navigator.of(context).pushNamed("/numbers/add");
          });
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
