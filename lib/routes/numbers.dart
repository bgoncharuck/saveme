import 'package:flutter/material.dart';
import 'package:saveme/widgets/navigation_button.dart';

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
